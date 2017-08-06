---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - c
  - cpp
  - python
  - qml
  - java
  - ofx
  - Unity
  - Pd
  - max
  - sc

toc_footers:
  - <a href='https://github.com/OSSIA/libossia'>Get libossia on Github</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>


search: true
---

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/tripit/slate). Feel free to edit it and use it as a base for your own API's documentation.


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



