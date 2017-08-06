---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - c: C
  - cpp--98: C++98
  - cpp--14: C++14
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


# Architecture

## Local device

```c
#include <ossia-c/ossia-c.h>
...
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
    std::make_unique<ossia::oscquery::multiplex_protocol>(),
    "supersoftware"};
```

```python
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

Ability to create a local device for the application

## Remote Device
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



