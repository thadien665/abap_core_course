CLASS zcl_01_learning_v25 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_learning_v25 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

data update_tab type table for update /dmo/R_AgencyTP.
update_tab = value #(  (  agencyID = '070016' name = 'modified agency' ) ).

modify ENTITIES OF /dmo/R_AgencyTP
ENTITY /dmo/agency
UPDATE FIELDS (  name )
with update_tab.

commit ENTITIES.

  ENDMETHOD.
ENDCLASS.
