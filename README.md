# OBS_CountdownToDate
Makes a Text Source a Timer


# OBS Countdown Timer Script

This Lua script for OBS Studio allows users to create a dynamic countdown timer that updates a text source to display the number of days remaining until a specified target date.

## Features

- Dynamically updates a text source with the number of days left until a specified date.
- Easy to set up and use within OBS Studio.

## Installation

To install this script, follow these steps:

1. Download the `countdown_timer.lua` script from this repository.
2. Open OBS Studio.
3. Navigate to the `Tools` menu and select `Scripts`.
4. In the Scripts window, click the `+` button and choose the downloaded Lua script.
5. The script should now be added to your list of scripts in OBS.

## Configuration

After loading the script, you will need to configure it:

1. In the script settings, enter the name of the text source you want to update in the `Text Source` field. (Make the text source first)
2. Enter the target date for your countdown in the `Target Date (YYYY-MM-DD)` field.
3. The script will automatically update the text source with the number of days left.

## Usage

Once you have set up the text source and target date, the script will run in the background and update the specified text source with the countdown. Make sure that the text source name matches exactly with the one in OBS, including any capitalization.

## Script Hooks

- `script_properties()`: Defines the script properties for the OBS interface.
- `script_update(settings)`: Loads the script settings and updates the text.
- `script_description()`: Provides a description of what the script does in OBS.



## Support

For any issues or questions regarding the script, please open an issue on this GitHub repository.

## Contributing

Contributions to this script are welcome! Please fork the repository, make your changes, and submit a pull request.

## License

This script is distributed under the MIT License. See `LICENSE` for more information.


