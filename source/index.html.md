---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - c: C
  - cpp--98: Safe C++
  - cpp--14: Fast C++
  - python: Python
  - qml: QML
  - cpp--ofx: OFX
  - csharp: Unity3D
  - plaintext--pd: Pd
  - plaintext--max: Max
  - smalltalk: SuperCollider

toc_footers:
  - <a href='https://github.com/OSSIA/libossia'>Get libossia on Github</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>


search: true
---

# Introduction

**libossia** is a modern C++, cross-environment distributed object model for creative coding and interaction scoring.
It allows to expose the parameters of your creative coding application over the network, and score them in time.

It handles various protocols such as OSC, MIDI, Minuit and OSCQuery.
It offers bindings for many environments (PureData, Max/MSP, Python, Unity3D, QML, Faust, SuperCollider).

Here's a quick explanation of the bindings:

* **C** : a C89 binding that should work everywhere and has a stable and strong API & ABI guarantee.
* **Safe C++**: a simplified C++ binding, kept compatible with C++98, which makes it hard to have problems at the cost of performance.
* **Fast C++**: the native libossia API, written in modern C++14. Subject to frequent updates and changes; use to get maximal performance.
* **Python**: Python 2 / 3 bindings made with [pybind11](https://github.com/pybind/pybind11).
* **QML**: Bindings for the Qt declarative UI language, [QML](http://doc.qt.io/qt-5/qmlapplications.html). Very nice for user interfaces.
* **OFX**: OpenFrameworks bindings. Requires the [ofxOssia](https://github.com/OSSIA/ofxOSSIA) addon.
* **Unity3D**: Bindings for the Unity3D game engine. Required C# files are [here](https://github.com/jcelerier/ossia-unity3d/tree/master/ossia).
* **Pd**: PureData bindings. Requires at least Pd vanilla 0.48/
* **Max**: Max/MSP bindings. Requires at least Max 7.
* **SuperCollider**: Requires a custom build of SuperCollider.
* **Faust**: A Faust architecture file is provided. It should be modified however to tailor your own system.

# Setup

## Compilation

```c
// device.c:
#include <ossia-c/ossia-c.h>
int main(int argc, char** argv) { }

// Assuming the release package is extracted here:

// Linux:
gcc -std=c89 device.c -Iossia/include -Lossia/lib -lossia

// Mac:
clang -std=c89 device.c -Iossia/include -Lossia/lib -lossia

// Windows with MSVC: run in a Visual Studio shell:
cl.exe -std=c89 device.c -Iossia/include ossia/lib/ossia.lib
```

```cpp--98
// device.cpp:
#include <ossia-cpp/ossia-cpp98.hpp>
int main(int argc, char** argv) { }

// Assuming the release package is extracted here:

// Linux:
g++ -std=c++98 device.c -Iossia/include -Lossia/lib -lossia

// Mac:
clang++ -std=c++98 device.c -Iossia/include -Lossia/lib -lossia

// Windows with MSVC: run in a Visual Studio shell:
cl.exe device.c -Iossia/include ossia/lib/ossia.lib
```

```cpp--14
// device.cpp:
#include <ossia/ossia.hpp>
int main(int argc, char** argv) { }

// Assuming the release package is extracted here:

// Linux:
g++ -std=c++1z device.c -Iossia/include -Lossia/lib -lossia

// Mac:
clang++ -std=c++1z device.c -Iossia/include -Lossia/lib -lossia

// Windows with MSVC: run in a Visual Studio shell:
cl.exe device.c -Iossia/include ossia/lib/ossia.lib
```

```python
// device.py:
import ossia_python as ossia

// Run with ossia_python.{so,dll,dylib} in the current folder
python device.py
```

```qml
// Device.qml
import Ossia 1.0 as Ossia

Item {}

// Extract the Ossia folder in the Qt/qml folder, e.g.
// /home/myself/Qt/5.9.1/gcc_64/qml
// /Users/myself/Qt/5.9.1/clang_64/qml
// c:\Qt\5.9.1\msvc2017_64\qml
// etc...
// and run :
qmlscene Device.qml
```

```cpp--ofx
// Like every other ofx addon
```

```csharp
// Create a new empty GameObject and add the script OssiaDevice.cs to it.
```

```plaintext--pd
// Install with Deken
```

```plaintext--max
// Extract the ossia package to Documents/Max 7/Packages.
```

```smalltalk
```



# Architecture


## Local OSCQuery device

```c
#include <ossia-c/ossia-c.h>
...
ossia_protocol_t proto = ossia_protocol_oscquery_server_create(1234, 5678);
ossia_device_t dev = ossia_device_create(proto, "supersoftware");
```

```cpp--98
#include <ossia-cpp/ossia-cpp98.hpp>
...
opp::oscquery_server dev("supersoftware");
```

```cpp--14
#include <ossia/ossia.hpp>
...
ossia::net::generic_device dev{
    std::make_unique<ossia::oscquery::oscquery_server_protocol>(1234, 5678),
    "supersoftware"};
```

```python
import ossia_python as ossia
local_device = ossia.LocalDevice("supersoftware")
```

```qml
import Ossia 1.0 as Ossia
...
Ossia.OSCQueryServer {
    name: "supersoftware"
}
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

<pre class="highlight plaintext tab-plaintext--max"><img src="/images/ossia.device.png" /></pre>


```smalltalk
```

A device represents a tree of parameters.

Local devices map to real parameters on the executable libossia is used with.
For instance the frequency of a filter, etc.

Remote devices are **mirror images** of local devices on other applications:
remote controls, mobile apps, etc.
Every parameter in a local device will be synchronized with the remote
devices that connected to it.

Devices can be mapped to different protocols: **Minuit**, **OSCQuery**, etc.
For the sake of simplicity, some bindings tie together device and protocol
implementation.

We use OSCQuery as an example of protocol here.
Once a device has been created

## Remote OSCQuery Device
```c
#include <ossia-c/ossia-c.h>
...
ossia_protocol_oscquery_mirror_create("ws://localhost:5678");
```

```cpp--98
#include <ossia-cpp/ossia-cpp98.hpp>
...
opp::oscquery_mirror mirror{"my_mirror", "ws://localhost:5678"};
mirror.refresh();
```

```cpp--14
#include <ossia/ossia.hpp>
#include <ossia/network/oscquery/oscquery_mirror.hpp>
...
auto proto = new ossia::oscquery::oscquery_mirror_protocol{"ws://localhost:5678"};
ossia::net::generic_device dev{
    std::unique_ptr<ossia::oscquery::oscquery_mirror_protocol>(proto),
    "my_mirror"};
proto->update(dev);
```

```python
```

```qml
import Ossia 1.0 as Ossia
...
Ossia.OSCQueryMirror {
    name: "my_mirror"
    host: "ws://localhost:5678"
}
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Ability to connect to an existing device and exchange messages with it

## Address properties
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to get & set various properties on addresses : domain, accesss mode, description, etc

## Extended properties
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to get & set less common properties: critical, hidden, etc

## Address callbacks
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to do something in reaction to a value being received through the network

## Device callbacks
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to do something in reaction to a node being created, removed, etc

## Logging
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to use the libossia logging facilities

## Preset
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to load & save preset files

## Preset instances
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to create new objects in reaction to the loading of a preset

# Communication
## Midi, OSC, OSCQuery
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to create the relevant protocol

## OSCQuery instances
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to create and remove objects in reaction to OSCQuery messages

## Raw messages
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to send messages without the node actually existing in the tree, e.g. like a "basic" OSC library

## Pattern matching
```c
```

```cpp--98
```

```cpp--14
```

```python
```

```qml
```

```cpp--ofx
```

```csharp
```

```plaintext--pd
```

```plaintext--max
```

```smalltalk
```


Being able to send and receive messages according to OSC pattern matching addresses



