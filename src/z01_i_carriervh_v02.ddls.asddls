@AbapCatalog.sqlViewName: 'Z_HELP_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z01_I_CarrierVH_v02'
define view Z01_I_CarrierVH_v02 as select from /dmo/carrier
{
    @UI.lineItem: [{ position: 10 }]
    key carrier_id as CarrierID,
    @UI.lineItem: [{ position: 20 }]
        name as Name
    
    
}
