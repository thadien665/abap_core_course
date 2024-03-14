*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_data definition final.

  public section.

  class-methods get_carrier
    importing i_carrier_id type /dmo/carrier_id
    RETURNING VALUE(r_carrier) type /dmo/carrier
    raising cx_abap_invalid_value.


  protected section.

  private section.

endclass.

class lcl_data implementation.



  method get_carrier.
select single *
    from /dmo/carrier
    where carrier_id = @i_carrier_id
    into @r_carrier.

    if sy-subrc <> 0.
    raise EXCEPTION type cx_abap_invalid_value.
    endif.
  endmethod.

endclass.
