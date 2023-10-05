//https://github.com/moment/moment/blob/develop/moment.d.ts#L5
module T = {
  type relativeTimeKey = [
    | #s
    | #ss
    | #m
    | #mm
    | #h
    | #hh
    | #d
    | #dd
    | #w
    | #ww
    | #M
    | #MM
    | #y
    | #yy
  ]
  type _calendarKey = [#someDay | #nextDay | #lastDay | #nextWeek | #lastWeek | #sameElse]
  type _calendarKeyEnum = CalendarKey(_calendarKey) | String(string)
  /**
   * makeCalendarKey
   */
  type calendarKey
  type longDateFormatKey = [
    | #LTS
    | #LT
    | #L
    | #LL
    | #LLL
    | #LLLL
    | #lts
    | #lt
    | #l
    | #ll
    | #lll
    | #llll
  ]
  type moment = {}
  type momentObjectOutput = {
    years: int,
    /* One digit */
    months: int,
    /* Day of the month */
    date: float,
    hours: float,
    minutes: float,
    seconds: float,
    milliseconds: float,
  }
  type locale = {
    calendar: (~key: calendarKey=?, ~m: moment, ~now: moment) => string,
    longDateFormatKey: (~key: longDateFormatKey) => string,
    invalidDate: unit => string,
    ordinal: (~n: float) => string,
    preparse: (~inp: string) => string,
    postformat: (~inp: string) => string,
    relativeTime: (
      ~n: float,
      ~withoutSuffix: bool,
      ~key: relativeTimeKey,
      ~isFuture: bool,
    ) => string,
    pastFuture: (~diff: float, ~absRelTime: string) => string,
    set: (~config: Js.Dict.t<string>) => unit,
    // months: unit => array<string>, //todo
    months: (~m: moment, ~format: string=?) => string,
    // monthsShort:() //todo
    mothnsShort: (~m: moment, ~format: string=?) => string,
    monthsParse: (~monthName: string, ~format: string, ~strict: bool) => float,
    monthsRegex: (~strict: bool) => Js.Re.t,
    monthsShortRegex: (~strict: bool) => Js.Re.t,
    week: (~m: moment) => int,
    firstDayOfYear: unit => int,
    firstDoayOfWeek: unit => int,
    // weekDays: unit => array<string>,
    weekdays: (~m: moment, ~format: string=?) => string,
    //    weekdaysMin:()=>array< string>,
    weekdaysMin: (~m: moment) => string,
    //  weekdaysShort(): string[];
    weekdaysShort: (~m: moment) => string,
    weekdaysParse: (~weekdayName: string, ~format: string, ~strict: bool) => int,
    weekdaysRegex: (~strict: bool) => Js.Re.t,
    weekdaysShortRegex: (~strict: bool) => Js.Re.t,
    weekdaysMinRegex: (~strict: bool) => Js.Re.t,
    isPM: (~input: string) => bool,
    meridiem: (~hour: int, ~minute: int, ~isLower: bool) => string,
  }
  type standaloneFormatSpec = {
    format: array<string>,
    standalone: array<string>,
    isFormat?: Js.Re.t,
  }

  type weekSpec = {
    dow: int,
    doy?: int,
  }

  type calendarSpecVal
  //    = string | ((m?: MomentInput, now?: Moment) => string); //todo

  type calendarSpec = {
    "sameDay": calendarSpecVal,
    "nextDay": calendarSpecVal,
    "lastDay": calendarSpecVal,
    "nextWeek": calendarSpecVal,
    "lastWeek": calendarSpecVal,
    "sameElse": calendarSpecVal,
  } // [x: string]: CalendarSpecVal | void; // undefined
  type relativeTimeSpecVal
  //  =
  // | string
  // | ((
  //     n: number,
  //     withoutSuffix: boolean,
  //     key: RelativeTimeKey,
  //     isFuture: boolean
  //   ) => string);
  type relativeTimeFuturePastVal
  //   = string | ((relTime: string) => string);
  type relativeTimeSpec = {
    future?: relativeTimeFuturePastVal,
    past?: relativeTimeFuturePastVal,
    s?: relativeTimeSpecVal,
    ss?: relativeTimeSpecVal,
    m?: relativeTimeSpecVal,
    mm?: relativeTimeSpecVal,
    h?: relativeTimeSpecVal,
    hh?: relativeTimeSpecVal,
    d?: relativeTimeSpecVal,
    dd?: relativeTimeSpecVal,
    w?: relativeTimeSpecVal,
    ww?: relativeTimeSpecVal,
    @as("M")
    _M?: relativeTimeSpecVal,
    @as("MM")
    _MM?: relativeTimeSpecVal,
    y?: relativeTimeSpecVal,
    yy?: relativeTimeSpecVal,
  }
  type longDateFormatSpec = {
    @as("LTS")
    _LTS: string,
    @as("LT")
    _LT: string,
    @as("L")
    _L: string,
    @as("LL")
    _LL: string,
    @as("LLL")
    _LLL: string,
    @as("LLLL")
    _LLLL: string,
    // // lets forget for a sec that any upper/lower permutation will also work
    lts?: string,
    lt?: string,
    l?: string,
    ll?: string,
    lll?: string,
    llll?: string,
  }
  type monthWeekdayFn = (~momentToFormat: moment, ~format: string=?) => string
  type meekdaySimpleFn = (~momentToFormat: moment) => string
  type eraSpec = {
    since: string, //todo
    until: string, //todo
    offset: int,
    name: string, // str or num //todo
    narrow: string,
    abbr: string,
  }
  type localeSpecification = {
    months?: string, //[standaloneFormatSpec | monthWeekdayFn], //todo add strings
    monthsShort?: string, //[standaloneFormatSpec | monthWeekdayFn], //todo add strings
    weekdays?: string, //[standaloneFormatSpec | monthWeekdayFn], //todo add strings
    weekdaysShort?: string, //[standaloneFormatSpec | weekdaySimpleFn], //todo add strings
    weekdaysMin?: string, // [standaloneFormatSpec | weekdaySimpleFn], //todo add strings
    meridiemParse?: Js.Re.t,
    meridiem?: (~hour: int, ~minute: int, ~isLower: bool) => string,
    isPM?: (~input: string) => bool,
    longDateFormat?: longDateFormatSpec,
    calendar?: calendarSpec,
    relativeTime?: relativeTimeSpec,
    invalidDate?: string,
    ordinal?: (~n: int) => string,
    ordinalParse?: Js.Re.t,
    week?: weekSpec,
    eras?: array<eraSpec>,

    // Allow anything: in general any property that is passed as locale spec is
    // put in the locale object so it can be used by locale functions
    // [x: string]: any;
  }
  type momentParsingFlags = {
    empty: bool,
    unusedTokens: array<string>,
    unusedInput: array<string>,
    overflow: float,
    charsLeftOver: float,
    nullInput: bool,
    invalidMonth: string, // null //todo
    invalidFormat: bool,
    userInvalidated: bool,
    iso: bool,
    parsedDateParts: array<string>, //todo
    meridiem: string, // null //todo
  }

  type momentParsingFlagsOpt = {
    empty?: bool,
    unusedTokens?: array<string>,
    unusedInput?: array<string>,
    overflow?: float,
    charsLeftOver?: float,
    nullInput?: bool,
    invalidMonth?: string,
    invalidFormat?: bool,
    userInvalidated?: bool,
    iso?: bool,
    parsedDateParts?: array<string>, ///todo
    meridiem?: string,
  }
  type momentBuiltinFormat = {__momentBuiltinFormatBrand: string} //todo
  type momentFormationSpecification //todo
  module UnitOfTime = {
    type base = [
      | #year
      | #years
      | #y
      | #month
      | #months
      | #M
      | #week
      | #weeks
      | #w
      | #day
      | #days
      | #d
      | #hour
      | #hours
      | #h
      | #minute
      | #minutes
      | #m
      | #second
      | #seconds
      | #s
      | #millisecond
      | #milliseconds
      | #ms
    ]
    type _quarter = [#quarter | #quarters | #Q]
    type _isoWeek = [#isoWeek | #isoWeeks | #W]
    type _date = [#date | #dates | #D]
    type durationConstructor = [base | _quarter | _isoWeek]
    type durationAs = base
    type startOf = [base | _quarter | _isoWeek | _date] // null

    type diff = [base | _quarter]

    type momentConstructor = [base | _date]
    type all = [
      | base
      | _quarter
      | _isoWeek
      | _date
      | #weekYear
      | #weekYears
      | #gg
      | #isoWeekYear
      | #isoWeekYears
      | #GG
      | #dayOfYear
      | #dayOfYears
      | #DDD
      | #weekday
      | #weekdays
      | #e
      | #isoWeekday
      | #isoWeekdays
      | #E
    ]
  }
  type numberlike //todo
  //    = number | string;
  type momentInputObject = {
    years?: numberlike,
    year?: numberlike,
    y?: numberlike,
    months?: numberlike,
    month?: numberlike,
    @as("M")
    _M?: numberlike,
    days?: numberlike,
    day?: numberlike,
    d?: numberlike,
    dates?: numberlike,
    date?: numberlike,
    @as("D")
    _D?: numberlike,
    hours?: numberlike,
    hour?: numberlike,
    h?: numberlike,
    minutes?: numberlike,
    minute?: numberlike,
    m?: numberlike,
    seconds?: numberlike,
    second?: numberlike,
    s?: numberlike,
    milliseconds?: numberlike,
    millisecond?: numberlike,
    ms?: numberlike,
  }
  type durationInputObject = {
    ...momentInputObject,
    quarters?: numberlike,
    quarter?: numberlike,
    @as("Q")
    _Q?: numberlike,
    weeks?: numberlike,
    week?: numberlike,
    w?: numberlike,
  }

  type momentSetObject = {
    ...momentInputObject,
    weekYears?: numberlike,
    weekYear?: numberlike,
    gg?: numberlike,
    isoWeekYears?: numberlike,
    isoWeekYear?: numberlike,
    @as("GG")
    _GG?: numberlike,
    quarters?: numberlike,
    quarter?: numberlike,
    @as("Q")
    _Q?: numberlike,
    weeks?: numberlike,
    week?: numberlike,
    w?: numberlike,
    isoWeeks?: numberlike,
    isoWeek?: numberlike,
    @as("W")
    _W?: numberlike,
    dayOfYears?: numberlike,
    dayOfYear?: numberlike,
    @as("DDD")
    _DDD?: numberlike,
    weekdays?: numberlike,
    weekday?: numberlike,
    e?: numberlike,
    isoWeekdays?: numberlike,
    isoWeekday?: numberlike,
    @as("E")
    _E?: numberlike,
  }
  type momentInput //todo
  // =
  // | Moment
  // | Date
  // | string
  // | number
  // | (number | string)[]
  // | MomentInputObject
  // | void; // null | undefined
  type fromTo = {
    from: momentInput,
    to: momentInput,
  }
  type durationInputArg1 //todo
  // =
  // | Duration
  // | number
  // | string
  // | FromTo
  // | DurationInputObject
  // | void; // null | undefined
  type durationInputArg2 = UnitOfTime.durationConstructor
  type localeSpecifier //todo
  //   = string | Moment | Duration | string[] | boolean;
}
module Utils = {
  module Identity = {
    external calendarKeyIdentity: 'a => T.calendarKey = "%identity"
  }
  let makeCalendarKey: T._calendarKeyEnum => T.calendarKey = calendarKeyEnum => {
    switch calendarKeyEnum {
    | T.CalendarKey(c) => Identity.calendarKeyIdentity(c) //err
    | T.String(s) => Identity.calendarKeyIdentity(s) // actual res
    }
  }
}
