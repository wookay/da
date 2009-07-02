{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 88.0, 70.0, 473.0, 459.0 ],
		"bglocked" : 0,
		"defrect" : [ 88.0, 70.0, 473.0, 459.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 18.0,
		"default_fontface" : 0,
		"default_fontname" : "Monaco",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "test.maxpat\nwookay.noh at gmail.com",
					"linecount" : 2,
					"numoutlets" : 0,
					"bgcolor" : [ 0.545098, 0.85098, 0.592157, 1.0 ],
					"id" : "obj-12",
					"fontname" : "Monaco",
					"patching_rect" : [ 16.0, 20.0, 266.0, 55.0 ],
					"numinlets" : 1,
					"fontsize" : 18.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"hint" : "got",
					"text" : "expr 1 + 2",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"id" : "obj-10",
					"fontname" : "Monaco",
					"patching_rect" : [ 271.0, 273.0, 119.0, 31.0 ],
					"numinlets" : 1,
					"fontsize" : 18.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-3",
					"blinkcolor" : [ 1.0, 0.090196, 0.090196, 1.0 ],
					"patching_rect" : [ 408.0, 394.0, 51.0, 51.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"hint" : "expected",
					"text" : "3",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"id" : "obj-8",
					"fontname" : "Monaco",
					"patching_rect" : [ 133.0, 273.0, 32.5, 31.0 ],
					"numinlets" : 2,
					"fontsize" : 18.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-11",
					"patching_rect" : [ 319.0, 194.0, 20.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-7",
					"blinkcolor" : [ 0.180392, 1.0, 0.090196, 1.0 ],
					"patching_rect" : [ 133.0, 393.0, 51.0, 51.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 600",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-5",
					"fontname" : "Monaco",
					"patching_rect" : [ 319.0, 123.0, 108.0, 31.0 ],
					"numinlets" : 2,
					"fontsize" : 18.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"hint" : "run",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.0, 0.298039, 1.0, 1.0 ],
					"id" : "obj-1",
					"patching_rect" : [ 319.0, 25.0, 54.0, 54.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js assert_equal.js",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"id" : "obj-2",
					"fontname" : "Monaco",
					"patching_rect" : [ 133.0, 329.0, 294.0, 31.0 ],
					"numinlets" : 3,
					"fontsize" : 18.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 328.5, 235.0, 142.5, 235.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 328.5, 235.0, 280.5, 235.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-2", 2 ],
					"hidden" : 0,
					"midpoints" : [ 328.5, 235.0, 417.5, 235.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-2", 1 ],
					"hidden" : 0,
					"midpoints" : [ 280.5, 317.5, 280.0, 317.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [ 328.5, 168.0, 328.5, 168.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 1 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 417.5, 375.5, 417.5, 375.5 ]
				}

			}
 ]
	}

}
