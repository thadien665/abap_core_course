*"* use this source file for your ABAP unit test classes
class ltcl_test definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      test_success for testing raising cx_static_check.
      methods test_exception for testing.
endclass.


class ltcl_test implementation.

  method test_success.
*Preparation: read an arbitrary carrier_id from DB
**************************************************
select single
from /dmo/carrier
fields carrier_id
into @data(carrier_id).

if sy-subrc <> 0.
    cl_abap_unit_assert=>fail( 'Test requires at least one entry in DB table /dmo/carier' ).
    endif.

* Do the test of method lcl_data=>get_carrier ()
****************************************************
try.
data(carrier) = lcl_data=>get_carrier( carrier_id ).
CATCH cx_abap_invalid_value.

cl_abap_unit_assert=>fail( msg = 'inapropiate exception'
* level = if_abap_unit_constant=>severity-medium
* quit = if_abap_unit_constant=>quit-test
detail = 'method lcl_data=>get_carrier() raises an exception when it should not').
ENDTRY.

  endmethod.

  method test_exception.
* specify a carrier_id that (hopefully) does not exist in the DB
****************************************************************

Constants  c_wrong_carrier_id type /dmo/carrier_id value 'XX'.

* preparation: make sure that carrier does not exist on DB
***********************************************************

select single
from /dmo/carrier
fields carrier_id
where carrier_id = 'XX'
into @data(carrier_id).

if sy-subrc = 0.
 " Carrier exists in DB table /dmo/carrier, stop testing
 cl_abap_unit_assert=>fail( msg = |Carrier (c_wrong_carrier_id ) exists in /dmo/carrier|
level = if_abap_unit_constant=>severity-high
quit = if_abap_unit_constant=>quit-test
detail = 'if DB table /dmo/carrier contains an entry' && |with carrier_id = '{ c_wrong_carrier_id }'| && 'it is not possiblew to test the exception' ).
endif.

* Do the test of method lcl_data=>get_carrier
***********************************************

try.

data(carrier) = lcl_data=>get_carrier( carrier_id ).

cl_abap_unit_assert=>fail( msg = 'No exception'
* level = if_abap_unit_constant=>severity-medium
* quit = if_abap_unit_constant=>quit-test
detail = 'Method lcl_data=>get_carrier() does not raise an exception whe it should do so' ).

catch cx_abap_invalid_value.
endtry.


  endmethod.

endclass.
