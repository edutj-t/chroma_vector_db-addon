# Chroma Vector DB Home Assistant Add-on

This add-on provides a Home Assistant integrated instance of the [Chroma Vector Database](https://docs.trychroma.com/docs/overview/getting-started). It ensures that the Chroma package is kept up-to-date and allows customization via configuration options.

## Features

- **Automatic Updates:** On startup, the add-on installs (or upgrades) Chroma to the version specified in the configuration.
- **Customizable:** Set the Chroma version and port through the add-on options.
- **Integrated Logging:** Uses Home Assistant’s [bashio](https://github.com/home-assistant/bashio) to log activity.

## Installation

1. Clone this repository into your Home Assistant add-ons folder.
2. Restart Home Assistant or reload the add-ons.
3. Install the add-on from the Supervisor > Add-on Store.
4. Adjust the configuration options as needed.
5. Start the add-on.

## Configuration Options

- **chroma_version:** (string) The version of Chroma to use. Set to `latest` to always use the latest version.  
  _Default: `"latest"`_
- **port:** (int) The port on which Chroma will run.  
  _Default: `8000`_

## Security

This add-on runs in a secure environment provided by Home Assistant. As with any software, please review the code and configuration before use.

## Additional Resources

- [Chroma Documentation](https://docs.trychroma.com/docs/overview/getting-started)
- [Home Assistant Add-on Development](https://developers.home-assistant.io/docs/add-ons/)
