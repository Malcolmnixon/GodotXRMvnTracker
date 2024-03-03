# Godot XR MVN Tracker

![GitHub forks](https://img.shields.io/github/forks/Malcolmnixon/GodotXRMvnTracker?style=plastic)
![GitHub Repo stars](https://img.shields.io/github/stars/Malcolmnixon/GodotXRMvnTracker?style=plastic)
![GitHub contributors](https://img.shields.io/github/contributors/Malcolmnixon/GodotXRMvnTracker?style=plastic)
![GitHub](https://img.shields.io/github/license/Malcolmnixon/GodotXRMvnTracker?style=plastic)

This repository contains an MVN packet decoder for Godot that can drive avatars through the XR Tracker system.

## Versions

Official releases are tagged and can be found [here](https://github.com/Malcolmnixon/GodotXRMvnTracker/releases).

The following branches are in active development:
|  Branch   |  Description                  |  Godot version   |
|-----------|-------------------------------|------------------|
|  master   | Current development branch    |  Godot 4.3-dev4+ |

## Overview

[MVN Animate](https://www.movella.com/products/motion-capture/xsens-mvn-animate) is a Motion Capture package by Movella.

## Usage

The following steps show how to add the Godot MVN tracker to a project.

### Enable Addon

The addon files needs to be copied to the `/addons/godot_mvn_tracker` folder of the Godot project, and then enabled in Plugins under the Project Settings:
![Enable Plugin](/docs/enable_plugin.png)

### Plugin Settings

The plugin has numerous options to control behavior:

![Plugin Options](/docs/plugin_settings.png)

| Option | Description |
| :----- | :---------- |
| Tracking - Position Mode | Controls the position of the character:<br>- Free = Free Movement<br>- Calibrate = Calibrate to origin on first frame<br>- Locked = Lock to origin |
| Tracking - Body Tracker Name | Name for the XRBodyTracker |
| Network - Udp Listener Port | Port to listen for MVN network packets |

### Character Importing

The character model must be in Godot Humanoid format. This can be achieved in the importer settings by retarteting the skeleton to the SkeletonProfileHumanoid bone map:

![Character Import](/docs/character_import.png)

### Body Driving

The body is driven using an [XRBodyModifier3D](https://docs.godotengine.org/en/latest/classes/class_xrbodymodifier3d.html) node configured to drive the skeleton of the character:

![XRBodyModifier3D](/docs/xrbodymodifier3d.png)

Note that the Body Tracker name should match the Body Tracker Name specified in the Plugin Settings.

### MVN Animate

MVN Animate must be configured for network streaming, which is an option only in the MVN Animate Plus and MVN Animate Pro licenses.

![MVN Animate](/docs/mvn_animate_streamer.png)

| Option | Description |
| :----- | :---------- |
| Host | Host address (127.0.0.1 for localhost) | 
| Port | UDP Port 9763 (default) |
| Protocol | UDP |
| Datagram Selection | Position + Orientation (Quaternion) |


## Licensing

Code in this repository is licensed under the MIT license.

## About this repository

This repository was created by Malcolm Nixon

It is primarily maintained by:
- [Malcolm Nixon](https://github.com/Malcolmnixon/)

For further contributors please see `CONTRIBUTORS.md`
