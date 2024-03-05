CLASS zcl_01_learning_v10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_LEARNING_V10 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

data carrier_id type /dmo/carrier_id.
data connection_id type /dmo/connection_id.

  DATA connection type ref to lcl_connection.
data connections type table of ref to lcl_connection.

  connection = new #( ).
connection->set_attributes(
exporting
i_carrier_id = 'LH'
i_connection_id = '0400' ).

  append connection to connections.

  connection = new #( ).

connection->set_attributes(
exporting
i_carrier_id = 'AA'
i_connection_id = '0170' ).

  append connection to connections.

  loop at connections into connection.

connection->get_attributes(
importing
e_carrier_id = carrier_id
e_connection_id = connection_id ).

out->write(  |Flight connection { carrier_id } { connection_id }| ).
endloop.

  ENDMETHOD.
ENDCLASS.
