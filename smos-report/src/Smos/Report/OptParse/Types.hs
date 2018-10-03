module Smos.Report.OptParse.Types
    ( module Smos.Report.Clock.Types
    , module Smos.Report.Agenda.Types
    , module Smos.Report.OptParse.Types
    , module Smos.Report.ShouldPrint
    ) where

import Path

import Smos.Report.Agenda.Types
import Smos.Report.Clock.Types
import Smos.Report.ShouldPrint

type Arguments = (Command, Flags)

type Instructions = (Dispatch, Settings)

data Command
    = CommandWaiting
    | CommandNext
    | CommandClock ClockFlags
    | CommandAgenda AgendaFlags
    deriving (Show, Eq)

data Flags = Flags
    { flagConfigFile :: Maybe FilePath
    , flagWorkDir :: Maybe FilePath
    , flagShouldPrint :: Maybe ShouldPrint
    } deriving (Show, Eq)

data ClockFlags = ClockFlags
    { clockFlagPeriodFlags :: Maybe ClockPeriod
    , clockFlagResolutionFlags :: Maybe ClockResolution
    , clockFlagBlockFlags :: Maybe ClockBlock
    } deriving (Show, Eq)

data AgendaFlags = AgendaFlags
    { agendaFlagHistoricity :: Maybe AgendaHistoricity
    } deriving (Show, Eq)

data Configuration = Configuration
    { configWorkDir :: Maybe FilePath
    , configShouldPrint :: Maybe ShouldPrint
    } deriving (Show, Eq)

data Settings = Settings
    { setWorkDir :: Path Abs Dir
    , setShouldPrint :: ShouldPrint
    } deriving (Show, Eq)

data Dispatch
    = DispatchWaiting
    | DispatchNext
    | DispatchClock ClockSettings
    | DispatchAgenda AgendaSettings
    deriving (Show, Eq)

data ClockSettings = ClockSettings
    { clockSetPeriod :: ClockPeriod
    , clockSetResolution :: ClockResolution
    , clockSetBlock :: ClockBlock
    } deriving (Show, Eq)

data AgendaSettings = AgendaSettings
    { agendaSetHistoricity :: AgendaHistoricity
    } deriving (Show, Eq)
