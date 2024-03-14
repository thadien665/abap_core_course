CLASS zcl_03_literals_v02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_literals_v02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 SELECT FROM /dmo/flight
         FIELDS seats_max,
                seats_occupied,

                seats_max - seats_occupied           AS seats_avaliable,

                (   CAST( seats_occupied AS FLTP )
                  / CAST(  seats_max AS FLTP )
                ) * CAST( 100 AS FLTP )      AS percentage_fltp

           WHERE carrier_id = 'LH' AND connection_id = '0400'
            INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).

  ENDMETHOD.
ENDCLASS.
