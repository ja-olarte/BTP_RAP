@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z_C_BKSUPPL_343
  as projection on Z_r_BKSUPPL_343
{
  key BookingSupplUUID,
      TravelUUID,
      BookingUUUID,

      @Search.defaultSearchElement: true
      BookingSupplementID,

      @ObjectModel.text.element: [ 'SupplementDescription' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Supplement_StdVH',
                                                     element: 'SupplementID'},
                                            additionalBinding: [{ localElement: 'BookSupplPrice',
                                                                  element: 'Price',
                                                                  usage: #RESULT },
                                                                { localElement: 'CurrencyCode',
                                                                  element: 'CurrencyCode',
                                                                  usage: #RESULT }],
                                            useForValidation: true }]
      SupplementID,
      _SupplementText.Description as SupplementDescription : localized,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookSupplPrice,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                     element: 'Currency'},
                                            useForValidation: true }]
      CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      /* Associations */
      _Booking : redirected to parent Z_C_BOOKING_343,
      _Product,
      _SupplementText,
      _Travel  : redirected to Z_C_TRAVEL_343
}
