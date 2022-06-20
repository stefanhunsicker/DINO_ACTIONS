"! <p class="shorttext synchronized" lang="en">Dino Crushing Class: Initial Version</p>
CLASS zcl_dino_action_crush DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "! Method printing out a message to the command line
    "! @parameter with_everything | the dino gives it all
    "! @parameter with_singing | the dino sings
    "! @parameter with_dancing | the dino dances
    "! @parameter with_arriving_on_a_pogo_stick | the dino arrives on a pogo stick
    METHODS do_action
      IMPORTING with_everything               TYPE abap_boolean
                with_singing                  TYPE abap_boolean DEFAULT abap_false
                with_dancing                  TYPE abap_boolean DEFAULT abap_false
                with_arriving_on_a_pogo_stick TYPE abap_boolean DEFAULT abap_false
                out                           TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dino_action_crush IMPLEMENTATION.

  METHOD do_action.
    IF with_singing = abap_true.
      out->write( 'Dino is going to sing a song.' ).
      DATA(prior_action) = abap_true.
    ENDIF.
    IF with_dancing = abap_true.
      out->write( 'Dino is going to dance like you dance when there is no-one around.' ).
      prior_action = abap_true.
    ENDIF.
    IF with_arriving_on_a_pogo_stick = abap_true.
      out->write( 'Boing! Boing! Here comes the dino!' ).
    ENDIF.
    IF with_everything = abap_true.
      IF prior_action = abap_true.
        out->write( 'Dino is then going to crush everything in its way!' ).
      ELSE.
        out->write( 'Dino will crush everything in its way!' ).
      ENDIF.
    ELSE.
      IF prior_action = abap_true.
        out->write( 'Dino is then going to play it cool.' ).
      ELSE.
        out->write( 'Dino is just going to play it cool.' ).
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    do_action( with_everything = abap_false out = out ).
    do_action( with_everything = abap_true out = out ).
    do_action( with_everything = abap_true with_dancing = abap_true out = out ).
  ENDMETHOD.

ENDCLASS.
