@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_r_TRAVEL_343
  as select from ztravel_343
  composition [0..*] of Z_r_BOOKING_343 as _Booking
{
  key travel_uuid           as TravelUUID,

      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      //local ETag field - OData
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //total ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      // Make association public
      _Booking
}
