
var target = UIATarget.localTarget();
var appName = target.frontMostApp().mainWindow().name;
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().buttons()[6].tap();
target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
target.frontMostApp().keyboard().typeString("sooooo");
target.tap({x:184.50, y:393.00});
target.frontMostApp().mainWindow().pickers()[0].wheels()[0].dragInsideWithOptions({startOffset:{x:0.82, y:0.62}, endOffset:{x:0.81, y:0.25}, duration:1.4});
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().tableViews()[0].dragInsideWithOptions({startOffset:{x:0.40, y:0.23}, endOffset:{x:0.12, y:0.23}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.90, y:0.24}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.57, y:0.16}});
target.frontMostApp().mainWindow().buttons()[2].tap();
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().tableViews()[0].dragInsideWithOptions({startOffset:{x:0.62, y:0.43}, endOffset:{x:0.25, y:0.43}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.96, y:0.42}});
target.frontMostApp().mainWindow().tableViews()[0].dragInsideWithOptions({startOffset:{x:0.73, y:0.24}, endOffset:{x:0.42, y:0.24}});
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.51, y:0.24}});
target.frontMostApp().mainWindow().buttons()[2].tap();
target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
target.frontMostApp().keyboard().typeString(" call\n");
target.frontMostApp().navigationBar().leftButton().tap();
