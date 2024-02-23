CLASS zcl_delete_table_268_013_rar DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_delete_table_268_013_rar IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM zrent_brands_013.

    IF sy-subrc EQ 0.
        out->write( 'All data deleted from zrent_brands_013' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
