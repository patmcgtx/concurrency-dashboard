# concurrency-dashboard

A lab for experimenting with Swift concurrency.

The basic idea is to have a bunch of `Publisher`s and ways to view and stream them in an interactive SwiftUI app — and along the way, experiment with bridging modern Swift concurrency (`async`/`await` + `Task`s) with Combine and old-school GCD.

⚠️ This is a rough lab and always in progress. Not production code!

## What's here

A SwiftUI + SwiftData iOS/macOS app (`ConcurrencyDashboard/`) built around one core idea: a `DashboardEmitter` protocol describes a data source as a Combine `AnyPublisher<String, Never>`, and a single `DashboardItemView` consumes any emitter's publisher via `for await value in emitter.publisher.values`, bridging Combine into an async `Task`.

## Project organization 

### Emitters
Implementations of `DashboardEmitter`.

  - `TimeEmitter` streams a formatted piece of the current time/date on a timer.
  - `SingleIntEmitter` emits a single static value once.
  - `OrderedStringEmitter` streams a fixed list of strings, paced by a timer.

### Views
The user-facing SwiftUI views.

  - `MainView` — top-level tab container (Dashboard, Clock, and a placeholder Music tab).
  - `DashboardView` — a grid of mixed emitters (time, ints, ordered strings), shuffleable.
  - `ClockView` — a grid of `TimeEmitter`s broken into calendar/clock components (year, month, hour, ms, timezone, etc.).
  - `DashboardItemView` — the shared card that renders any emitter's name and live-streamed value.

### Persistence
A default SwiftData `Item` model, wired up in `ConcurrencyDashboardApp` but not yet used by the UI.

## Running it

Open `ConcurrencyDashboard/ConcurrencyDashboard.xcodeproj` in Xcode and run the `ConcurrencyDashboard` scheme.

Several emitter files also include inline `#Playground` blocks (Xcode 26+ Playgrounds) for poking at a single emitter's output in isolation.
