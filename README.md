## Ark Station 13 (Nova Sector => /tg/station Downstream)

[![CI Suite](https://github.com/ArkStation13/Ark-Station-13/actions/workflows/ci_suite.yml/badge.svg)](https://github.com/ArkStation13/Ark-Station-13/actions/workflows/ci_suite.yml)
[![Percentage of issues still open](http://isitmaintained.com/badge/open/ArkStation13/Ark-Station-13.svg)](http://isitmaintained.com/project/ArkStation13/Ark-Station-13 "Percentage of issues still open")
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/ArkStation13/Ark-Station-13.svg)](http://isitmaintained.com/project/ArkStation13/Ark-Station-13 "Average time to resolve an issue")

[![resentment](.github/images/badges/built-with-resentment.svg)](.github/images/comics/131-bug-free.png) [![technical debt](.github/images/badges/contains-technical-debt.svg)](.github/images/comics/106-tech-debt-modified.png) [![forinfinityandbyond](.github/images/badges/made-in-byond.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a)

| Website                   | Link                                           |
|---------------------------|------------------------------------------------|
| Вебсайт                   | [https://www.spacestation13.space/](https://www.spacestation13.space/)      							   |
| Код	                    | [https://github.com/ArkStation13y/Ark-Station-13](https://github.com/ArkStation13/Ark-Station-13) 		   |
| Вики                      | [https://wiki.spacestation13.space/](https://wiki.spacestation13.space/)  									 |
| Дискорд Сервер			| [https://discord.gg/novasector](https://discord.gg/novasector)															 |
| Coderbus Discord          | [https://discord.com/invite/eAvpD6a7av](https://discord.com/invite/eAvpD6a7av)               |


Это Арк Станция 13. Форк Нова Сектора, который в свою очередь является форком ТГ станции.

**Данный репозиторий содержит контент, предназначеный для лиц старше 18-и лет.**

Space Station 13 — это наполненная паранойей ролевая игра, действие которой разворачивается на фоне бессмысленной металлической смертельной ловушки, маскирующейся под космическую станцию, с очаровательными спрайтами, призванными передать научно-фантастический сеттинг и его опасный подтекст. Веселитесь и выживайте!

## ВАЖНАЯ ЗАМЕТКА - ТЕСТИРУЙТЕ СВОИ ПУЛЛ РЕКВЕСТЫ

Вы несете ответственность за тестирование вашего контента и предоставление доказательств этого в вашем Пулл Реквесте. Не следует помечать Пулл Реквест готовым к рассмотрению до тех пор, пока вы его не протестируете. Если вам нужен отдельный клиент для тестирования, вы можете использовать гостевую учетную запись, выйдя из BYOND и подключившись к тестовому серверу. Тестовые слияния предназначены не для поиска ошибок, а для стресс-тестов, где локальное тестирование просто не позволяет этого.

## ГАЙД ПО РАЗРАБОТКЕ
![image](https://i.imgur.com/aJnE4WT.png)

[Гайд по модульности](./modular_nova/readme.md)

## УСТАНОВКА БИЛДА
[Скачивание и установка](.github/guides/DOWNLOADING.md)

[Запуск локального сервера](.github/guides/RUNNING_A_SERVER.md)

[Карты и Гейты](.github/guides/MAPS_AND_AWAY_MISSIONS.md)

## КОМПИЛЯЦИЯ БИЛДА

Найди `BUILD.bat` в корневой папке билда, и запусти. Компиляция состоит из нескольких шагов, и его работа может занять около 1–5 минут.

**Сборка tgstation напрямую в DreamMaker устарела и может привести к ошибкам**, таким как `'tgui.bundle.js': cannot find file`.

**[Как скомпилировать билд в VSCode и настроить его](tools/build/README.md).**

## КОНТРИБЬЮТОРЫ
[Гайды для Контрибьюторов](.github/CONTRIBUTING.md)

[/tg/station HACKMD аккаунт](https://hackmd.io/@tgstation)

Заинтерисованы в развитии лора сервер? [Заходите в наш Дискорд сервер](https://discord.com/invite/eAvpD6a7av)

## ЛИЦЕНЗИЯ

All code after [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU AGPL v3](https://www.gnu.org/licenses/agpl-3.0.html).

All code before [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
(Including tools unless their readme specifies otherwise.)

See LICENSE and GPLv3.txt for more details.

The TGS DMAPI is licensed as a subproject under the MIT license.

See the footer of [code/__DEFINES/tgs.dm](./code/__DEFINES/tgs.dm) and [code/modules/tgs/LICENSE](./code/modules/tgs/LICENSE) for the MIT license.

All assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.
