// import 'package:flutter/material.dart';
// import 'package:trego_app/features/Accomodations%20Search/Bloc/accommodation_details_cubit/accommodation_details.dart';
// import 'package:trego_app/features/Accomodations%20Search/Domain/Entities/accommodation_entity.dart';
// import 'package:trego_app/features/Auth/Forget%20Password/bloc/reset_password_bloc.dart';
// import 'package:trego_app/features/Auth/Register/bloc/register_bloc.dart';
// import 'package:trego_app/features/Auth/Register/register_data_cubit/register_data_cubit.dart';
// import 'package:trego_app/features/Auth/Register/register_pages_cubit/register_pages_cubit.dart';
// import 'package:trego_app/features/Trip%20Finding/Bloc/cities%20bloc/get_all_cities_bloc.dart';
// import 'package:trego_app/features/Trip%20Finding/Domain/Entities/city_entity.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/booking%20process%20bloc/booking_process_bloc.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/reservation_payment_cubit/cubit/reservation_payment_cubit.dart';
// import 'package:trego_app/features/Trips%20Booking/Bloc/timer_bloc/cubit/timer_cubit.dart';
// import 'package:trego_app/features/Trips%20Booking/Data/Models/reservation_bus_trip_model.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Bloc/bus%20trips%20search%20bloc/bus_trips_search_bloc.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Buses/Bloc/chosen%20trips%20bloc/chosen_trips.dart';
// import 'package:trego_app/features/Trips%20Search%20Results/Flights/Bloc/cubit/flights_cubit.dart';
// import 'package:trego_app/features/flights_trip_finding/Bloc/cities%20bloc/get_flights_airports_bloc.dart'
//     show GetFlightsAirportsBloc;
// import 'package:trego_app/features/flights_trip_finding/Bloc/flights%20trip%20details%20cubit/flights_trip_details.dart';
// import 'package:trego_app/features/flights_trip_finding/Bloc/flights%20trip%20details%20cubit/flights_trip_details_cubit.dart';
// import 'package:trego_app/features/flights_trip_finding/Domain/Entities/flights_airport_entity.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import '../../features/Accomodations Search/Bloc/accommodation_details_cubit/accommodation_details_cubit.dart';
// import '../../features/Trip Finding/Bloc/trip details cubit/trip_details.dart';
// import '../../features/Trip Finding/Bloc/trip details cubit/trip_details_cubit.dart';
// import '../helpers/enums.dart';

// class TripFindingRouteArguments {
//   final String image;
//   final String bGAsset;
//   final String title;
//   final String type;
//   final TripVehicleType vehicleType;
//   final CityEntity? toCity;
//   final String serviceId;

//   TripFindingRouteArguments({
//     required this.image,
//     required this.title,
//     required this.type,
//     required this.bGAsset,
//     required this.vehicleType,
//     required this.serviceId,
//     this.toCity,
//   });
// }

// class FlightsTripFindingRouteArguments {
//   final String image;
//   final String bGAsset;
//   final String title;
//   final String type;
//   final TripVehicleType vehicleType;
//   final FlightAirportEnity? toCity;
//   final String serviceId;

//   FlightsTripFindingRouteArguments({
//     required this.image,
//     required this.title,
//     required this.type,
//     required this.bGAsset,
//     required this.vehicleType,
//     required this.serviceId,
//     this.toCity,
//   });
// }

// class AccommodationFindingRouteArguments {
//   final String image;
//   final String bGAsset;
//   final String title;
//   final String type;

//   AccommodationFindingRouteArguments({
//     required this.image,
//     required this.title,
//     required this.type,
//     required this.bGAsset,
//   });
// }

// class StationChoosingScreenArguments {
//   final String title;
//   final String prefixAsset;
//   final String hintText;
//   final GetAllCitiesBloc getAllCitiesBloc;
//   final Function(CityEntity city, BuildContext context) onSelectStation;

//   StationChoosingScreenArguments({
//     required this.title,
//     required this.getAllCitiesBloc,
//     required this.prefixAsset,
//     required this.hintText,
//     required this.onSelectStation,
//   });
// }

// class FlightsStationChoosingScreenArguments {
//   final String title;
//   final String prefixAsset;
//   final String hintText;
//   final GetFlightsAirportsBloc getFlightsAirportsBloc;
//   final Function(FlightAirportEnity city, BuildContext context) onSelectStation;

//   FlightsStationChoosingScreenArguments({
//     required this.title,
//     required this.getFlightsAirportsBloc,
//     required this.prefixAsset,
//     required this.hintText,
//     required this.onSelectStation,
//   });
// }

// class DateChoosingScreenArguments {
//   final String title;
//   final TripDetailsCubit tripDetailsCubit;
//   DateChoosingScreenArguments({
//     required this.title,
//     required this.tripDetailsCubit,
//   });
// }

// class FlightsDateChoosingScreenArguments {
//   final String title;
//   final FlightsTripDetailsCubit flightsTripDetailsCubit;
//   final int tripIndex;
//   final DateTime? focusedDepartureDay;
//   final Function({required DateTime day, required BuildContext screenContext})? onDaySelected;

//   FlightsDateChoosingScreenArguments({
//     required this.title,
//     this.tripIndex = 0,
//     this.focusedDepartureDay,
//     required this.flightsTripDetailsCubit,
//     this.onDaySelected,
//   });
// }

// class AccommodationDateChoosingScreenArguments {
//   final String title;
//   final AccommodationDetailsCubit accommodationDetailsCubit;
//   AccommodationDateChoosingScreenArguments({
//     required this.title,
//     required this.accommodationDetailsCubit,
//   });
// }

// class TripsSearchResultsScreenArguments {
//   final String backgroundAsset;
//   final String cardAsset;
//   final TripDetails tripDetails;
//   final String chosenTripVehicleAsset;

//   const TripsSearchResultsScreenArguments({
//     required this.backgroundAsset,
//     required this.cardAsset,
//     required this.tripDetails,
//     required this.chosenTripVehicleAsset,
//   });
// }

// class FlightsSearchResultsScreenArguments {
//   final String backgroundAsset;
//   final String cardAsset;
//   final FlightsTripDetails flightTripDetails;
//   final String chosenTripVehicleAsset;

//   const FlightsSearchResultsScreenArguments({
//     required this.backgroundAsset,
//     required this.cardAsset,
//     required this.flightTripDetails,
//     required this.chosenTripVehicleAsset,
//   });
// }

// class BusTripsFiltersScreenArguments {
//   final BusTripsSearchBloc busTripsSearchBloc;
//   final bool isReturnTrip;
//   final ChosenBusTrips chosenBusTrips;

//   BusTripsFiltersScreenArguments({
//     required this.busTripsSearchBloc,
//     required this.isReturnTrip,
//     required this.chosenBusTrips,
//   });
// }

// class FlightsTripsFiltersScreenArguments {
//   final FlightsCubit flightsCubit;

//   final FlightsTripDetails flightsTripDetails;
//   FlightsTripsFiltersScreenArguments({
//     required this.flightsCubit,
//     required this.flightsTripDetails,
//   });
// }

// class TrainTripsSearchResultsScreenArguments {
//   final String backgroundAsset;
//   final String cardAsset;
//   final TripDetails tripDetails;

//   const TrainTripsSearchResultsScreenArguments({
//     required this.backgroundAsset,
//     required this.cardAsset,
//     required this.tripDetails,
//   });
// }

// class AccommodationSearchRouteArguments {
//   final String backgroundAsset;
//   final String cardAsset;
//   final AccommodationDetails accommodationDetails;

//   const AccommodationSearchRouteArguments({
//     required this.backgroundAsset,
//     required this.cardAsset,
//     required this.accommodationDetails,
//   });
// }

// class TravellersNumberChoosingScreenArguments {
//   final String title;
//   final TripDetailsCubit tripDetailsCubit;

//   TravellersNumberChoosingScreenArguments({
//     required this.title,
//     required this.tripDetailsCubit,
//   });
// }

// class FlightsTravellersNumberChoosingScreenArguments {
//   final String title;
//   final FlightsTripDetailsCubit flightsTripDetailsCubit;

//   FlightsTravellersNumberChoosingScreenArguments({
//     required this.title,
//     required this.flightsTripDetailsCubit,
//   });
// }

// class AccommodationTravellersNumberChoosingScreenArguments {
//   final String title;
//   final AccommodationDetailsCubit accommodationDetailsCubit;

//   AccommodationTravellersNumberChoosingScreenArguments({
//     required this.title,
//     required this.accommodationDetailsCubit,
//   });
// }

// class OTPScreenArguments {
//   final RegisterPagesCubit registerPagesCubit;
//   final RegisterDataCubit registerDataCubit;
//   final RegisterBloc registerBloc;
//   final int timer;
//   final String identifier;
//   final String type;

//   OTPScreenArguments({
//     required this.identifier,
//     required this.type,
//     required this.timer,
//     required this.registerDataCubit,
//     required this.registerPagesCubit,
//     required this.registerBloc,
//   });
// }

// class AccommodationDetailsScreenArguments {
//   final AccommodationDetails accommodationDetails;
//   final AccommodationsHotelEntity accommodationEntity;
//   AccommodationDetailsScreenArguments({
//     required this.accommodationDetails,
//     required this.accommodationEntity,
//   });
// }

// class SeatsSelectionScreenArguments {
//   final TripBookingProcessBloc tripBookingProcessBloc;
//   final int initialIndex;
//   SeatsSelectionScreenArguments({
//     required this.initialIndex,
//     required this.tripBookingProcessBloc,
//   });
// }

// class ResetPasswordScreenArguments {
//   final String identifier;
//   final String otp;
//   final String type;
//   final ResetPasswordBloc resetPasswordBloc;

//   ResetPasswordScreenArguments({
//     required this.identifier,
//     required this.otp,
//     required this.type,
//     required this.resetPasswordBloc,
//   });
// }

// class ResetPasswordOTPScreenArguments {
//   final String identifier;
//   final String type;
//   ResetPasswordOTPScreenArguments({required this.identifier, required this.type});
// }

// class ResetPasswordWithIdentifierArgument {
//   final String identifier;
//   final String type;
//   final ResetPasswordBloc resetPasswordBloc;
//   final int timer;
//   ResetPasswordWithIdentifierArgument({
//     required this.timer,
//     required this.identifier,
//     required this.type,
//     required this.resetPasswordBloc,
//   });
// }

// class PaymentWebViewScreenArguments {
//   final Function() onTokenExpired;
//   final WebViewController controller;
//   final TimerCubit timerCubit;
//   final ReservationPaymentCubit reservationPaymentCubit;
//   PaymentWebViewScreenArguments({
//     required this.controller,
//     required this.onTokenExpired,
//     required this.timerCubit,
//     required this.reservationPaymentCubit,
//   });
// }

// class UpcomingTicketDetailsArguments {
//   final BusTripReservationModel trip;
//   final BuildContext userReservationsContext;

//   UpcomingTicketDetailsArguments({
//     required this.trip,
//     required this.userReservationsContext,
//   });
// }

// class RemoveSeatsScreenArguments {
//   final BuildContext upcomingDetailsContext;
//   final BuildContext userReservationsContext;
//   final BusTripReservationModel trip;

//   RemoveSeatsScreenArguments({
//     required this.trip,
//     required this.upcomingDetailsContext,
//     required this.userReservationsContext,
//   });
// }

// class FlightTripDetailsScreenArguments {
//   final String uniqueTripId;
//   final String searchId;

//   FlightTripDetailsScreenArguments({
//     required this.uniqueTripId,
//     required this.searchId,
//   });
// }
