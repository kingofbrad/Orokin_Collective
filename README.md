# Orokin Collective

Orokin Collective is an unofficial iOS companion app for **Warframe**. Built with SwiftUI, it brings live game activity, news, and a searchable item Codex into one place.

This is a personal learning project and is not affiliated with or endorsed by Digital Extremes.

## Features

- **World State dashboard** for current PC activity, including alerts, events, sorties, Archon Hunts, Steel Path, and other timed activities.
- **Fissures** with active Void Fissure information.
- **Invasions** with attacker and defender progress.
- **Syndicates**, including Nightwave, Simaris targets, and open-world bounty information.
- **Timers and cycles** for activities such as Cetus, Fortuna, Earth, Cambion Drift, and Duviri.
- **News** from the Warframe community feed.
- **Searchable Codex** with category filtering and item detail views.
- **Local favourites** for Codex items, saved on the device with UserDefaults.

World State data is requested from the WarframeStat.us API for the PC platform. Availability and freshness depend on that community service. The app also triggers a World State refresh on a one-minute timer while it is open.

## Technology

- Swift and SwiftUI
- iOS 17.2 deployment target
- Xcode project with Swift Package Manager
- [WarframeStat.us API](https://docs.warframestat.us/)
- [AlertToast](https://github.com/elai950/AlertToast)

## Requirements

- macOS
- An Xcode version with iOS 17.2 SDK support
- An iOS 17.2 or later simulator or device

## Run locally

1. Clone the repository:

   ```bash
   git clone https://github.com/kingofbrad/Orokin_Collective.git
   cd Orokin_Collective
   ```

2. Open `Orokin Collective.xcodeproj` in Xcode.
3. Allow Xcode to resolve the Swift Package Manager dependency.
4. Select an iOS 17.2 or later simulator or a compatible device.
5. Build and run the `Orokin Collective` scheme.

No API key or separate backend configuration is required for the WarframeStat.us requests.

## Project structure

- `Orokin Collective/Views/Home/` — World State dashboard, timers, fissures, invasions, and syndicate screens.
- `Orokin Collective/Views/News/` — Warframe news interface.
- `Orokin Collective/Views/Codex/` — Codex search, item cards, and detail views.
- `Orokin Collective/Models/` — API response and app data models.
- `Orokin Collective/Services/` — Network and JSON handling.
- `Orokin Collective/ViewModels/` — View state and supporting logic.
- `Orokin Collective/Components/` — Reusable interface components.

## Credits

- World State and game data: [WarframeStat.us](https://docs.warframestat.us/)
- Codex assets: [WFCD Genesis Assets](https://github.com/WFCD/genesis-assets)
- The project was also inspired by [Warframe Hub](https://hub.warframestat.us/) and [Navis](https://github.com/WFCD/navis).
- Additional visual asset credits are documented in the project.

## License

This project is distributed under the GNU General Public License v3.0. See [LICENSE](LICENSE) for the full license text.
