# PoshLenovo

![Language: PowerShell](https://img.shields.io/badge/language-powershell-blue.svg)
![Tag: Lenovo](https://img.shields.io/badge/tag-lenovo-red.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![GitHub contributors](https://img.shields.io/github/contributors/AlexHedley/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/graphs/contributors/)
[![GitHub issues](https://img.shields.io/github/issues/AlexHedley/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/AlexHedley/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/issues?q=is%3Aissue+is%3Aclosed) | [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)


A PowerShell module for [Lenovo](https://www.lenovo.com/gb/en/) API.

---

The [eSupport WebAPI](http://supportapi.lenovo.com/Documentation/Index.html) Documentation has also been added to the [WIKI](https://github.com/AlexHedley/PoshLenovo/wiki)

---

You will need to contact either contact your 'Lenovo Account Representative' or maybe the 'Lenovo Partner Program': http://www.lenovo.com/partners/ to obtain a "ClientId".

---

### Example

#### Warranty

```powershell
$serial = "Add you Serial Number here"
$apikey = "Add your ClientId here"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("ClientID", $apikey)
 
$warranty = Invoke-RestMethod http://supportapi.lenovo.com/v2.5/warranty?serial=$serial -ContentType "application/JSON" -Headers $headers
$warranty
```

To get your Serial number run the following in Command Prompt (PC)

```bash
WMIC BIOS GET SERIALNUMBER
```

Terminal (Mac)

- `system_profiler SPHardwareDataType | awk '/Serial/ {print $4}'`
- `ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}'`
- `system_profiler |grep "Serial Number (system)"`
- `system_profiler |grep "r (system)"`

---

### Alternatives

- https://pcsupport.lenovo.com/gb/en/warrantylookup/
- https://pcsupport.lenovo.com/gb/en/warrantylookup/batchquery

There are also a number of scripts which post data to the above website but the API is a cleaner way to do this.
