# XY-Plotter

一个非常简易的制图机。使用Processing（上位机）与Arduino（MCU）完成**部分**原定功能。

**English version below.**

## 功能(原定)

- [ ] 在PC端通过键盘键入、鼠标单击输入数据，以list的方式存储。
- [ ] 用户自主键入或点击list中的数对构建直线与圆。
- [x] 构建过程中，上位机与MCU在后台建立串口通讯。
- [x] MCU以查询的方式向上位机索取单次走笔的数据。
- [x] 上位机确认有绘制任务，则向MCU传输此组数据。
- [ ] MCU解析此数据，并根据任务类型（直线/曲线）分类计算走笔过程。
- [x] MCU驱动电机与舵机完成单次绘制，并再一次查询。

## 功能（现有）

### Processing（上位机）

#### 主程序 MainSetupProcedure

进行上位机程序中全局变量的声明与其中部分类变量的初始化与实例化。开放串口并设置串口buffer为1。创建GUI中的窗口并显示文字。主循环体中执行显示文字图像的子程序。包含串口中断与键盘中断。

#### 键盘中断状态机 KeyboardInterruption

包括一个判断当前输入过程的状态机，将键盘输入的信息引导至恰当的子程序。

#### 数据输入程序 DataInputProcedure

将从键盘中断中引导来的key用于数据输入过程，并自动生成InputXAxis与InputYAxis两列位对应的变量。并最终作用于状态机。

#### 线条类创建初始化 LineCreation

创建一个LinePointPair类，含有两个方法。

#### 线条数对输入 LineCreationProcedure

将从键盘中断中引导来的key用于线条数对创建过程，并最终作用于状态机。

#### 圆弧类创建初始化 ArcCreation

创建一个CircleAxis类，含有三个方法。创建一个CircleCalculator函数，用于计算圆的参数。

#### 圆弧数组选择 ArcCreationProcedure

将从键盘中断中引导来的key用于圆弧数组创建过程，并最终作用于状态机。

#### 图形显示 GUIProcedure

含有数个子程序用于显示目前输入的数据，并生成调用类方法生成图像。

#### 串口数据推送 SerialDataPush

计量推送次数，在推送数小于数据数时，进行一次推送。（无法乱序进行输入与推送，即在开始推送时所有数据必须均已输入完毕）

#### 串口执行函数 SerialFunctions

包含查询函数与判断函数。

#### 串口中断 SerialInterruption

 中断中包含串口查询的实现基础。

### Arduino（MCU）

#### Main

包含主体变量群的声明与电机的初始化。循环体中包含串口程序。

#### DataPull

查询程序，未加入调用Print过程的语句，导致无法进入打印过程。

#### Print

直线与圆弧的绘制过程。目前圆弧的绘制未写出，WIP。

#### SerialFunctions

串口通讯的接收模块，参考网上的代码。

#### SerialMain

类似状态机，在不同状态下进行直线或曲线的查询行为。

## 期望加入的功能

1. 乱序创建直线圆弧与查询
2. 使用鼠标进行点输入与直线圆弧的创建
3. 绘制圆弧
4. 光标跟随模式
5. ……

# English Version

A very simple drawing machine. Use Processing (host computer) and Arduino (MCU) to complete **some of** the original functions.

**There could be some grammar error cuz these sentense are difficult. So I'm not able to get Chinese translated to English by myself.**

## Function (original)

- [ ]  Input data by keyboard typing and mouse click on the PC, and store it in a list.
- [ ]  The user autonomously types or clicks on the number pairs in the list to construct lines and circles.
- [x]  During the construction process, the host computer and MCU establish serial communication in the background.
- [x]  The MCU obtains the data of a single stroke from the upper computer by query.
- [x]  The upper computer confirms that there is a drawing task, and then transmits this group of data to the MCU.
- [ ]  The MCU parses this data and calculates the pen process according to the task type (straight line/curve).
- [x]  The MCU drives the motor and the steering gear to complete a single drawing and query again.

## Function (existing)

### Processing (upper computer)

#### Main program (MainSetupProcedure)

Carry out the declaration of global variables in the host computer program and the initialization and instantiation of some of the class variables. Open the serial port and set the serial buffer to 1. Create a window in the GUI and display text. The subroutine for displaying text and images is executed in the main loop body. Including serial port interrupt and keyboard interrupt.

#### Keyboard Interruption State Machine (KeyboardInterruption)

Including a state machine that judges the current input process, and guides the keyboard input to the appropriate subroutine.

#### Data Input Procedure (DataInputProcedure)

The key guided from the keyboard interrupt is used in the data input process, and the variables corresponding to InputXAxis and InputYAxis are automatically generated. And finally act on the state machine.

#### Line class creation and initialization (LineCreation)

Create a LinePointPair class with two methods.

#### Line number pair input (LineCreationProcedure)

The key guided from the keyboard interrupt is used in the creation process of the line number pair, and finally acts on the state machine.

#### Arc class creation and initialization (ArcCreation)

Create a CircleAxis class with three methods. Create a CircleCalculator function to calculate the parameters of the circle.

#### Arc array selection (ArcCreationProcedure)

The key guided from the keyboard interrupt is used in the arc array creation process, and finally acts on the state machine.

#### Graphic display (GUIProcedure)

Contains several subroutines used to display the currently input data and generate images by calling methods.

#### Serial data push (SerialDataPush)

Measure the number of pushes, and push once when the number of pushes is less than the number of data. (It is impossible to input and push out of order, that is, all data must have been input when starting to push)

#### Serial port execution functions (SerialFunctions)

Contains query functions and judgment functions.

#### Serial Interruption (SerialInterruption)

The interrupt contains the realization basis of the serial port query.

### Arduino (MCU)

#### Main

Including the declaration of the main variable group and the initialization of the motor. The loop body contains the serial port program.

#### DataPull

In the query program, the statement to call the Print process is not added, resulting in the inability to enter the printing process.

#### Print

The drawing process of straight lines and arcs. At present, the drawing of arc is not written, WIP.

#### SerialFunctions

For the receiving module of serial communication, refer to the code on the Internet.

#### SerialMain

Similar to a state machine, it performs straight or curved query behavior in different states.

#### Features expected to be added

1. Create straight arcs out of order and query
2. Use the mouse to enter points and create straight arcs
3. Draw arc
4. Cursor following mode
5. ...