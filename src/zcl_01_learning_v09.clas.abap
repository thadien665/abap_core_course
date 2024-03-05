CLASS zcl_01_learning_v09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_LEARNING_V09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection type ref to lcl_connection.
data connections type table of ref to lcl_connection.
  connection = new #( ).
  append connection to connections.
  connection = new #( ).
  append connection to connections.



  ENDMETHOD.
ENDCLASS.
