@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_r_BKSUPPL_343

  as select from zbksuppl_343

  association        to parent Z_r_BOOKING_343 as _Booking        on $projection.BookingUUUID = _Booking.BookingUUUID
  association [1..1] to Z_r_TRAVEL_343         as _Travel         on $projection.TravelUUID = _Travel.TravelUUID

  association [1..1] to /DMO/I_Supplement      as _Product        on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText  as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
  key bookingsuppl_uuid     as BookingSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUUID,

      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as BookSupplPrice,
      currency_code         as CurrencyCode,

      //local ETag - OData
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
