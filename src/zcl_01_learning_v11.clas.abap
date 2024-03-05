CLASS zcl_01_learning_v11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_LEARNING_V11 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  CONSTANTS c_carrier_id TYPE /dmo/carrier_id VALUE 'df'.
  CONSTANTS c_connection_id TYPE /dmo/connection_id VALUE '0'.
  DATA connection TYPE REF TO lcl_connection.
  DATA connections TYPE TABLE OF REF TO lcl_connection.
* Create Instance **********************************************************************
  connection = NEW #( ).
* Call Method and Handle Exception **********************************************************************
out->write( |i_carrier_id = '{ c_carrier_id }' | ).
out->write( |i_connection_id = '{ c_connection_id }'| ).
TRY.
connection->set_attributes( EXPORTING
i_carrier_id = c_carrier_id
i_connection_id = c_connection_id ).
APPEND connection TO connections.
out->write( `Method call successful` ).
CATCH cx_abap_invalid_value. out->write( `Method call failed` ).
ENDTRY.
endmethod.
ENDCLASS.
