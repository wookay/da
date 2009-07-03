{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 75.0, 192.0, 366.0, 369.0 ],
		"bglocked" : 0,
		"defrect" : [ 75.0, 192.0, 366.0, 369.0 ],
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
					"maxclass" : "button",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"blinkcolor" : [ 0.0, 1.0, 0.0, 1.0 ],
					"patching_rect" : [ 209.0, 103.0, 69.0, 69.0 ],
					"numinlets" : 1,
					"id" : "obj-31"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "0",
					"numoutlets" : 1,
					"fontname" : "Monaco",
					"outlettype" : [ "int" ],
					"fontsize" : 18.0,
					"patching_rect" : [ 127.0, 186.0, 32.5, 31.0 ],
					"numinlets" : 2,
					"id" : "obj-30"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "1",
					"numoutlets" : 1,
					"fontname" : "Monaco",
					"outlettype" : [ "int" ],
					"fontsize" : 18.0,
					"patching_rect" : [ 232.0, 186.0, 32.5, 31.0 ],
					"numinlets" : 2,
					"id" : "obj-28"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numoutlets" : 2,
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 48.0,
					"patching_rect" : [ 209.0, 286.0, 122.0, 62.0 ],
					"htextcolor" : [ 0.388235, 0.807843, 0.105882, 1.0 ],
					"numinlets" : 1,
					"id" : "obj-26"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"hint" : "reset",
					"annotation" : "",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"blinkcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 127.0, 103.0, 69.0, 69.0 ],
					"numinlets" : 1,
					"id" : "obj-21"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "count.maxpat\nwookay.noh at gmail.com",
					"linecount" : 2,
					"numoutlets" : 0,
					"bgcolor" : [ 0.545098, 0.85098, 0.592157, 1.0 ],
					"fontname" : "Monaco",
					"fontsize" : 18.0,
					"patching_rect" : [ 16.0, 20.0, 268.0, 55.0 ],
					"numinlets" : 1,
					"id" : "obj-12"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"hint" : "got",
					"text" : "accum",
					"numoutlets" : 1,
					"fontname" : "Monaco",
					"outlettype" : [ "int" ],
					"fontsize" : 18.0,
					"patching_rect" : [ 209.0, 232.0, 65.0, 31.0 ],
					"numinlets" : 3,
					"id" : "obj-10"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
