---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - c: C
  - cpp: C++
  - python: Python
  - qml: QML
  - java: Java
  - cpp: ofx
  - text: Unity
  - text: Pd
  - text: Max
  - text: SuperCollider

toc_footers:
  - <a href='https://github.com/OSSIA/libossia'>Get libossia on Github</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>


search: true
---

# Introduction

Libossia is a modern C++, cross-environment distributed object model for creative coding and interaction scoring. It allows to expose the parameters of your creative coding application over the network, and score them in time.

Libossia handles various protocoles such as OSC, Midi, Minuit and OSCQuery (in progres) and offers bindings for many environments (ie PureData, Max, Python, Unity3D, QML, Faust, SC).


# Architecture

## Local device
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```




Ability to create a local device for the application

## Remote Device
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Ability to connect to an existing device and exchange messages with it

## Address properties
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to get & set various properties on addresses : domain, accesss mode, description, etc

## Extended properties
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to get & set less common properties: critical, hidden, etc

## Address callbacks
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to do something in reaction to a value being received through the network

## Device callbacks
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to do something in reaction to a node being created, removed, etc

## Logging
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to use the libossia logging facilities

## Preset
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to load & save preset files

## Preset instances
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to create new objects in reaction to the loading of a preset

# Communication
## Midi, OSC, OSCQuery
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to create the relevant protocol

## OSCQuery instances
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to create and remove objects in reaction to OSCQuery messages

## Raw messages
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to send messages without the node actually existing in the tree, e.g. like a "basic" OSC library

## Pattern matching
```c
```

```cpp
```

```python
```

```qml
```

```java
```

```ofx
```

```Unity
```

```Pd
```

```max
```

```sc
```


Being able to send and receive messages according to OSC pattern matching addresses



