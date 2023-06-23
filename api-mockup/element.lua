-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Generic Element
--
-- All Elements share the same generic methods described below
-----------------------------------------------------------------------------------

Event = require("utils/event")

---@class Element
element = {}
element.__index = element
function Element()
    local self = {}

    --- Show the element widget in the in-game widget stack
    function self.showWidget() end
    ---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
    function self.show() error("Element.show() is deprecated, use Element.showWidget() instead.") end

    --- Hide the element widget in the in-game widget stack
    function self.hideWidget() end
    ---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
    function self.hide() error("Element.hide() is deprecated, use Element.hideWidget() instead.") end

    --- Returns the widget type compatible with the element data
    ---@return string value Widget type. "" if invalid.
    function self.getWidgetType() end

    --- Returns the element data as JSON
    ---@return string value Data as JSON
    function self.getWidgetData() end
    ---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
    function self.getData() error("Element.getData() is deprecated, use Element.getWidgetData() instead.") end

    --- Returns the element data ID
    ---@return string value Data ID. "" if invalid
    function self.getWidgetDataId() end
    ---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
    function self.getDataId() error("Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.") end

    --- Returns the element name
    ---@return string value The element's name
    function self.getName() end

    --- Returns the class of the element
    ---@return string value The class name of the Element
    function self.getClass() end
    ---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
    function self.getElementClass() error("Element.getElementClass() is deprecated, use Element.getClass() instead.") end

    --- Returns the item id of the class of the Element
    ---@param return integer The item ID of the item class
    function self.getClassId() end


    --- Returns the mass of the element (includes the included items' mass when the Element is a Container)
    ---@return number value The mass of the element
    function self.getMass() end

    --- Returns the element item ID (to be used with system.getItem() function to get information about the element).
    ---@return integer value The element item ID
    function self.getItemId() end

    
    --- Checks if the element is an element of the class given by its item id
    ---@param classId integer The item ID of the item class
    ---@return boolean True if the element is a valid element of the given class, false otherwise
    function self.isInClassId(classId) end

    --- Checks if the element is an element of the class given by its class name
    ---@param className string The name of the item class
    ---@return boolean value True if the element is a valid element of the given class, false otherwise
    function self.isInClass(className) end


    --- Returns the unique local ID of the element
    ---@return integer value The element local ID
    function self.getLocalId() end
    ---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
    function self.getId() error("Element.getId() is deprecated, use Element.getLocalId() instead.") end

    --- Returns the element integrity between 0 and 100
    ---@return number value The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
    function self.getIntegrity() end

    --- Returns the element's current hitpoints (0 = destroyed)
    ---@return number value The current element hitpoints
    function self.getHitPoints() end

    --- Returns the element's maximal hitpoints
    ---@return number value The maximum element hitpoints
    function self.getMaxHitPoints() end

    --- Returns the element's remaining number of restorations
    ---@return integer value The number of restorations before the element is ultimately destroyed
    function self.getRemainingRestorations() end

    --- Returns the element's maximal number of restorations
    ---@return integer value The max number of restorations of the element
    function self.getMaxRestorations() end

    --- Returns the position of the element in construct local coordinates.
    ---@return table value The position of the element in construct local coordinates
    function self.getPosition() end

    --- Returns the bounding box dimensions of the element.
    ---@return table value The dimensions of the element bounding box
    function self.getBoundingBoxSize() end

    --- Returns the position of the center of bounding box of the element in local construct coordinates.
    ---@return table value The dimensions the position of the center of bounding box
    function self.getBoundingBoxCenter() end

    --- Returns the up direction vector of the element in construct local coordinates
    ---@return table value Up direction vector of the element in construct local coordinates
    function self.getUp() end

    --- Returns the right direction vector of the element in construct local coordinates
    ---@return table value Right direction vector of the element in construct local coordinates
    function self.getRight() end

    --- Returns the forward direction vector of the element in construct local coordinates
    ---@return table value Forward direction vector of the element in construct local coordinates
    function self.getForward() end

    --- Returns the up direction vector of the element in world coordinates
    ---@return table value Up direction vector of the element in world coordinates
    function self.getWorldUp() end

    --- Returns the right direction vector of the element in world coordinates
    ---@return table value Right direction vector of the element in world coordinates
    function self.getWorldRight() end

    --- Returns the forward direction vector of the element in world coordinates
    ---@return table value Forward direction vector of the Element in world coordinates
    function self.getWorldForward() end


    --- Returns the Element IN plug map
    ---@return table plugMap The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
    function self.getInPlugs() end

    --- Returns the Element OUT plug map
    ---@return table plugMap The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
    function self.getOutPlugs() end


    --- Set the value of a signal in the specified IN plug of the Element.
    --- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
    --- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
    --- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
    --- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
    ---@param plug string The plug name, in the form of IN-SIGNAL-index
    ---@param state integer The plug signal state
    function self.setSignalIn(plug, state) end

    --- Returns the value of a signal in the specified IN plug of the Element.
    --- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
    --- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
    --- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
    --- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
    ---@param plug string The plug name, in the form of IN-SIGNAL-index
    ---@return integer value The plug signal state
    function self.getSignalIn(plug) end

    --- Returns the value of a signal in the specified OUT plug of the Element.
    --- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
    --- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
    --- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
    --- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
    ---@param plug string The plug name, in the form of IN-SIGNAL-index
    ---@return integer value The plug signal state
    function self.getSignalOut(plug) end

    return setmetatable(self, element)
end
