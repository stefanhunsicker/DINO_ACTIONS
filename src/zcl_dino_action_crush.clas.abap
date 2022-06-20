"! <p class="shorttext synchronized" lang="en">Dino Crushing Class: Initial Version</p>
CLASS zcl_dino_action_crush DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "! Method printing out a message to the command line
    "! @parameter with_everything | the dino gives it all
    METHODS do_action
      IMPORTING with_everything TYPE abap_boolean
                out             TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dino_action_crush IMPLEMENTATION.

  METHOD do_action.
    IF with_everything = abap_true.
      out->write( 'Dino will crush everything in its way!' ).
    ELSE.
      out->write( 'Dino is just going to play it cool.' ).
    ENDIF.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    do_action( with_everything = abap_false out = out ).
    do_action( with_everything = abap_true out = out ).
  ENDMETHOD.

ENDCLASS.
