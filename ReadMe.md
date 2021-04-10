# Rambo

Rambo is a bit of automation around [Windows Sandbox](https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview) to generate a .wsb file that launches the designated program after mounting that program's folder.

## Requirements

1. Windows 10 Pro or Enterprise
2. The "Windows Sandbox" feature enabled, which can be done via:
    1. Open an elevated PowerShell prompt
    2. Run `Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online`
    3. Reboot

## Try it

```batch
rambo.bat attack.bat
```

This should:

1. Generate a temporary `rambo.wsb` file which:
    1. Shares the folder where `attack.bat` is found, with the same path inside the sandbox, in read-only mode.
    2. Launches a generated `rambo_launch.bat` file, which will in turn launch `attack.bat` using `START` such that the console is visible, allowing progress to be tracked and diagnosis if there were any errors.
2. Launch Windows Sandbox against the generated `rambo.wsb` file.
3. Deletes the generated files once the sandbox is closed.

Here's a preview of the result!

![demo.png](demo.png)
