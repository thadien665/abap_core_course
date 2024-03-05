*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition.

  public section.

data: carrier_id type /dmo/carrier_id.
data: connection_id type /dmo/connection_id.

class-data conn_counter type i.

METHODS set_attributes
importing
i_carrier_id type /dmo/carrier_id optional
i_connection_id type /dmo/connection_id.

methods get_attributes
exporting
e_carrier_id type /dmo/carrier_id
e_connection_id type /dmo/connection_id.

  protected section.
  private section.

endclass.

class lcl_connection implementation.

  method set_attributes.

carrier_id = i_carrier_id.
connection_id = i_connection_id.

  endmethod.

  method get_attributes.

e_carrier_id = carrier_id.
e_connection_id = connection_id.

  endmethod.

endclass.
