abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeBottomNavState extends NewsStates {}

class NewsGetLoadingBusinessDataState extends NewsStates {}

class NewsGetSuccessfullyBusinessDataState extends NewsStates {}

class NewsGetErrorBusinessDataState extends NewsStates {
   final String exception;

   NewsGetErrorBusinessDataState (this.exception);
}


class NewsGetLoadingScienceDataState extends NewsStates {}

class NewsGetSuccessfullyScienceDataState extends NewsStates {}

class NewsGetErrorScienceDataState extends NewsStates {
   final String exception;

   NewsGetErrorScienceDataState (this.exception);
}


class NewsGetLoadingSportsDataState extends NewsStates {}

class NewsGetSuccessfullySportsDataState extends NewsStates {}

class NewsGetErrorSportsDataState extends NewsStates {
   final String exception;

   NewsGetErrorSportsDataState (this.exception);
}


class NewsGetLoadingSearchDataState extends NewsStates {}

class NewsGetSuccessfullySearchDataState extends NewsStates {}

class NewsGetErrorSearchDataState extends NewsStates {
   final String exception;

   NewsGetErrorSearchDataState (this.exception);
}