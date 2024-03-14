CLASS zcl_00_unit_test_1_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_unit_test_1_v02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

constants c_carrier_id type /dmo/carrier_id value 'xx'.

try.
    data(carrier) = lcl_data=>get_carrier( i_carrier_id = c_carrier_id ).

    out->write( carrier ).

    catch cx_abap_invalid_value.
    out->write( | Carrier { c_carrier_id } does not exist| ).
endtry.

  ENDMETHOD.
ENDCLASS.
