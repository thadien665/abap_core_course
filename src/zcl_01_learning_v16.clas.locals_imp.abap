*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.

PUBLIC SECTION.
CLASS-DATA conn_counter TYPE i.

METHODS constructor
IMPORTING i_connection_id TYPE /dmo/connection_id
          i_carrier_id TYPE /dmo/carrier_id
RAISING cx_ABAP_INVALID_VALUE .

METHODS get_output
RETURNING VALUE(r_output) TYPE string_table.

PROTECTED SECTION.

PRIVATE SECTION.
DATA carrier_id TYPE /dmo/carrier_id.
DATA connection_id TYPE /dmo/connection_id.
DATA airport_from_id TYPE /dmo/airport_from_id.
DATA airport_to_id TYPE /dmo/airport_to_id.
DATA carrier_name TYPE /dmo/carrier_name.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

METHOD constructor.
SELECT SINGLE FROM /DMO/I_Connection
FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
WHERE AirlineID = @i_carrier_id AND ConnectionID = @i_connection_id
INTO ( @airport_from_id, @airport_to_id, @carrier_name ).
if sy-subrc <> 0.
Raise EXCEPTION TYPE cx_abap_invalid_value.
endif.
me->connection_id = i_connection_id.
me->carrier_id = i_carrier_id.
conn_counter = conn_counter + 1.
IF carrier_id IS INITIAL OR connection_id IS INITIAL.
RAISE EXCEPTION TYPE cx_abap_invalid_value.
ENDIF.

ENDMETHOD.
METHOD get_output.
APPEND |------------------------------| TO r_output.
APPEND |Carrier:     { carrier_id } { carrier_name }| TO r_output.
APPEND |Connection: { connection_id }| TO r_output.
APPEND |Departure: { airport_from_id }| TO r_output.
APPEND |Destination: { airport_to_id }| TO r_output.


ENDMETHOD.
ENDCLASS.
