CLASS zcl_01_learning_v12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_LEARNING_V12 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
DATA connection TYPE REF TO lcl_connection.
DATA connections TYPE TABLE OF REF TO lcl_connection.
* Create Instance **********************************************************************
connection = NEW #( ).
connection->set_attributes(
EXPORTING
i_carrier_id = 'lh'
i_connection_id = '0400' ).
*APPEND connection TO connections.
* Calling Functional Method **********************************************************************
" in a value assignment (with inline declaration for result)
*DATA(result) = connection->get_output( ).
" in logical expression
*IF connection->get_output( ) IS NOT INITIAL.
" as operand in a statement
LOOP AT connection->get_output( ) INTO DATA(line).
ENDLOOP.
" to supply input parameter of another method
out->write( data = connection->get_output( ) ).
*ENDIF.
endmethod.
ENDCLASS.
