CLASS zcl_01_learning_v13 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_LEARNING_V13 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
DATA connection TYPE REF TO lcl_connection.
DATA connections TYPE TABLE OF REF TO lcl_connection.
* First Instance **********************************************************************
connection = NEW #( ).
try.
connection->set_attributes(
exporting
  i_carrier_id    = 'lh'
  i_connection_id = '0400'
).
APPEND connection TO connections.
CATCH cx_abap_invalid_value.
out->write(  'method call failed' ).
endtry.
*carrier_id = 'LH'.
*connection->connection_id = '0400'.
* Second Instance **********************************************************************
connection = NEW #( ).
try.
connection->set_attributes(
exporting
  i_carrier_id    = 'AA'
  i_connection_id = '0017'
).
APPEND connection TO connections.
CATCH cx_abap_invalid_value.
out->write(  'method call failed' ).
endtry.
*carrier_id = 'AA'.
*connection->connection_id = '0017'.
* Third Instance **********************************************************************
connection = NEW #( ).
try.
connection->set_attributes(
exporting
  i_carrier_id    = 'SQ'
  i_connection_id = '0001'
).
APPEND connection TO connections.
CATCH cx_abap_invalid_value.
out->write(  'method call failed' ).
endtry.
*carrier_id = 'SQ'.
*connection->connection_id = '0001'.
LOOP AT connections INTO connection.
out->write( data = connection->get_output( ) ).
ENDLOOP.
endmethod.
ENDCLASS.
