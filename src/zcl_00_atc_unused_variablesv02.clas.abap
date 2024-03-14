CLASS zcl_00_atc_unused_variablesv02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_atc_unused_variablesv02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

select from /dmo/connection
    fields *
    into table @data(connections).

*    connection_list = connection_list.

    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
