local redwine_interface = {}
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local RunService = game:GetService('RunService')

local default_theme = {
    windowBackground = Color3.fromRGB(75, 5, 25),
    windowStrokePrimary = Color3.fromRGB(0, 0, 0),
    windowStrokeSecondary = Color3.fromRGB(0, 0, 0),
    windowGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {0.320, Color3.fromRGB(226, 26, 255)},
        {1.000, Color3.fromRGB(255, 255, 255)},
    },
    windowTexturePrimary = Color3.fromRGB(150, 25, 75),
    topbarBackground = Color3.fromRGB(255, 255, 255),
    topbarTitleText = Color3.fromRGB(255, 255, 255),
    topbarTitleGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {0.164, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(101, 101, 101)},
    },
    topbarTitleStroke = Color3.fromRGB(0, 0, 0),
    windowIconColor = Color3.fromRGB(255, 255, 255),
    windowIconGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(101, 101, 101)},
    },
    controlIconColor = Color3.fromRGB(255, 255, 255),
    contentBackground = Color3.fromRGB(255, 255, 255),
    contentFrameBackground = Color3.fromRGB(32, 2, 12),
    contentFrameStroke = Color3.fromRGB(32, 2, 12),
    tabBarBackground = Color3.fromRGB(32, 2, 12),
    tabBarStroke = Color3.fromRGB(32, 2, 12),
    tabButtonBackgroundInactive = Color3.fromRGB(32, 2, 12),
    tabButtonBackgroundHover = Color3.fromRGB(128, 8, 48),
    tabButtonBackgroundActive = Color3.fromRGB(144, 9, 54),
    tabButtonBackgroundPress = Color3.fromRGB(16, 1, 6),
    tabButtonTextColor = Color3.fromRGB(255, 255, 255),
    tabButtonGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(100, 100, 100)},
    },
    tabButtonStroke = Color3.fromRGB(32, 2, 12),
    tabButtonHighlightStroke = Color3.fromRGB(0, 0, 0),
    textButtonBackgroundInactive = Color3.fromRGB(128, 8, 48),
    textButtonBackgroundHover = Color3.fromRGB(144, 9, 54),
    textButtonBackgroundActive = Color3.fromRGB(144, 9, 54),
    textButtonBackgroundPress = Color3.fromRGB(16, 1, 6),
    textButtonTextColor = Color3.fromRGB(255, 255, 255),
    textButtonGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(100, 100, 100)},
    },
    textButtonStroke = Color3.fromRGB(32, 2, 12),
    textButtonHighlightStroke = Color3.fromRGB(32, 2, 12),
    dropdownButtonBackgroundInactive = Color3.fromRGB(144, 9, 54),
    dropdownButtonBackgroundHover = Color3.fromRGB(160, 10, 60),
    dropdownButtonBackgroundActive = Color3.fromRGB(176, 11, 66),
    dropdownButtonBackgroundPress = Color3.fromRGB(96, 6, 36),
    dropdownButtonTextColor = Color3.fromRGB(255, 255, 255),
    dropdownButtonGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(100, 100, 100)},
    },
    dropdownButtonStroke = Color3.fromRGB(32, 2, 12),
    dropdownButtonHighlightStroke = Color3.fromRGB(0, 0, 0),
    dropdownOptionBackground = Color3.fromRGB(128, 8, 48),
    dropdownOptionBackgroundHover = Color3.fromRGB(144, 9, 54),
    dropdownOptionBackgroundSelected = Color3.fromRGB(176, 11, 66),
    dropdownOptionBackgroundSelectedHover = Color3.fromRGB(196, 12, 72),
    dropdownOptionTextColor = Color3.fromRGB(255, 255, 255),
    dropdownOptionGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(100, 100, 100)},
    },
    dropdownOptionStroke = Color3.fromRGB(32, 2, 12),
    dropdownOptionHighlightStroke = Color3.fromRGB(0, 0, 0),
    checkboxBackgroundInactive = Color3.fromRGB(128, 8, 48),
    checkboxBackgroundHover = Color3.fromRGB(144, 9, 54),
    checkboxBackgroundActive = Color3.fromRGB(144, 9, 54),
    checkboxBackgroundPress = Color3.fromRGB(16, 1, 6),
    checkboxGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(100, 100, 100)},
    },
    checkboxStroke = Color3.fromRGB(32, 2, 12),
    checkboxHighlightStroke = Color3.fromRGB(0, 0, 0),
    checkboxIconColor = Color3.fromRGB(255, 255, 255),
    checkboxTitleText = Color3.fromRGB(255, 255, 255),
    checkboxTitleGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(200, 200, 200)},
    },
    checkboxTitleStroke = Color3.fromRGB(0, 0, 0),
    checkboxSubtextText = Color3.fromRGB(220, 220, 220),
    checkboxSubtextGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(160, 160, 160)},
    },
    checkboxSubtextStroke = Color3.fromRGB(0, 0, 0),
    sliderLabelText = Color3.fromRGB(255, 255, 255),
    sliderLabelGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(200, 200, 200)},
    },
    sliderLabelStroke = Color3.fromRGB(0, 0, 0),
    sliderValueText = Color3.fromRGB(255, 255, 255),
    sliderValueGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(160, 160, 160)},
    },
    sliderValueStroke = Color3.fromRGB(0, 0, 0),
    sliderTrackBackground = Color3.fromRGB(64, 4, 24),
    sliderTrackFill = Color3.fromRGB(32, 2, 12),
    sliderTrackStroke = Color3.fromRGB(32, 2, 12),
    sliderHandleColor = Color3.fromRGB(255, 255, 255),
    sliderHandleStroke = Color3.fromRGB(32, 2, 12),
    sliderInputBackground = Color3.fromRGB(96, 6, 36),
    sliderInputTextColor = Color3.fromRGB(255, 255, 255),
    sliderInputPlaceholderColor = Color3.fromRGB(180, 160, 170),
    sliderInputGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(120, 120, 120)},
    },
    sliderInputStroke = Color3.fromRGB(32, 2, 12),
    sliderInputHighlightStroke = Color3.fromRGB(0, 0, 0),
    textLabelTextColor = Color3.fromRGB(230, 230, 230),
    textLabelGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(180, 180, 180)},
    },
    textLabelStroke = Color3.fromRGB(0, 0, 0),
    notificationBackground = Color3.fromRGB(48, 3, 17),
    notificationGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {0.420, Color3.fromRGB(226, 26, 255)},
        {1.000, Color3.fromRGB(255, 255, 255)},
    },
    notificationStroke = Color3.fromRGB(32, 2, 12),
    notificationHighlightStroke = Color3.fromRGB(0, 0, 0),
    notificationTitleText = Color3.fromRGB(255, 255, 255),
    notificationTitleGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(210, 210, 210)},
    },
    notificationTitleStroke = Color3.fromRGB(0, 0, 0),
    notificationMessageText = Color3.fromRGB(235, 235, 235),
    notificationMessageGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(190, 190, 190)},
    },
    notificationMessageStroke = Color3.fromRGB(0, 0, 0),
    notificationIconColor = Color3.fromRGB(255, 255, 255),
    subsectionBackground = Color3.fromRGB(32, 2, 12),
    subsectionStroke = Color3.fromRGB(32, 2, 12),
    subsectionTitleText = Color3.fromRGB(255, 255, 255),
    subsectionTitleStroke = Color3.fromRGB(0, 0, 0),
    subsectionTitleGradient = {
        {0.000, Color3.fromRGB(255, 255, 255)},
        {1.000, Color3.fromRGB(200, 200, 200)},
    },
}

redwine_interface.new = function()
    local interface = {
        name = 'redwine',
        version = '1.0',
        window_theme = 'default',
        windows = {},
        notifications = {},
    }

    local helpers = {}
    local defaultThemeTweenInfo = TweenInfo.new(0.36, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

    local function cloneValue(value)
        if typeof(value) == "table" then
            local copy = {}
            for key, inner in pairs(value) do
                copy[key] = cloneValue(inner)
            end
            return copy
        end
        return value
    end

    helpers.new_instance = function(class, properties)
        local instance = Instance.new(class)
        if properties then
            for property, value in pairs(properties) do
                instance[property] = value
            end
        end
        return instance
    end

    helpers.tween_object = function(object, properties, duration, easing_style, easing_direction)
        local tween_info = TweenInfo.new(
            duration or 0.25,
            easing_style or Enum.EasingStyle.Quad,
            easing_direction or Enum.EasingDirection.Out
        )
        local tween = TweenService:Create(object, tween_info, properties)
        tween:Play()
        return tween
    end

    helpers.merge_settings = function(defaults, overrides)
        local combined = {}
        for key, value in pairs(defaults) do
            combined[key] = cloneValue(value)
        end
        if overrides then
            for key, value in pairs(overrides) do
                combined[key] = cloneValue(value)
            end
        end
        return combined
    end

    helpers.copy_table = function(source)
        return cloneValue(source)
    end

    helpers.toColorSequence = function(value)
        if typeof(value) == "ColorSequence" then
            local keypoints = value.Keypoints
            local copied = {}
            for index, keypoint in ipairs(keypoints) do
                copied[index] = ColorSequenceKeypoint.new(keypoint.Time, keypoint.Value)
            end
            return ColorSequence.new(copied)
        end

        if typeof(value) == "table" then
            local copied = {}
            for index, entry in ipairs(value) do
                local time = entry.time or entry[1]
                local color = entry.color or entry[2]
                copied[index] = ColorSequenceKeypoint.new(time, color)
            end
            return ColorSequence.new(copied)
        end

        warn(string.format("Theme value for ColorSequence must be a ColorSequence or array of {time, Color3}; received %s", typeof(value)))
    end

    helpers.evaluateColorSequence = function(sequence, timePoint)
        local keypoints = sequence.Keypoints
        if #keypoints == 0 then
            return Color3.new(1, 1, 1)
        end

        if timePoint <= keypoints[1].Time then
            return keypoints[1].Value
        end

        local lastIndex = #keypoints
        if timePoint >= keypoints[lastIndex].Time then
            return keypoints[lastIndex].Value
        end

        for index = 1, lastIndex - 1 do
            local current = keypoints[index]
            local nextKey = keypoints[index + 1]
            if timePoint >= current.Time and timePoint <= nextKey.Time then
                local segmentLength = nextKey.Time - current.Time
                if segmentLength == 0 then
                    return nextKey.Value
                end
                local alpha = (timePoint - current.Time) / segmentLength
                return current.Value:Lerp(nextKey.Value, alpha)
            end
        end

        return keypoints[lastIndex].Value
    end

    helpers.collectColorSequenceTimes = function(sequenceA, sequenceB)
        local timesSet = {[0] = true, [1] = true}
        local times = {0, 1}

        local function appendTimes(sequence)
            if not sequence then
                return
            end
            for _, keypoint in ipairs(sequence.Keypoints) do
                local timePoint = keypoint.Time
                if not timesSet[timePoint] then
                    timesSet[timePoint] = true
                    table.insert(times, timePoint)
                end
            end
        end

        appendTimes(sequenceA)
        appendTimes(sequenceB)
        table.sort(times)
        return times
    end

    helpers.animate_color_sequence = function(binding, targetSequence)
        local instance = binding.instance
        if not instance then
            return
        end

        if binding.sequenceConnection then
            binding.sequenceConnection:Disconnect()
            binding.sequenceConnection = nil
        end

        local currentSequence = instance[binding.property]
        if typeof(currentSequence) ~= "ColorSequence" then
            instance[binding.property] = targetSequence
            return
        end

        local duration = (binding.tweenInfo and binding.tweenInfo.Time) or defaultThemeTweenInfo.Time
        if duration <= 0 then
            instance[binding.property] = targetSequence
            return
        end

        local startSequence = currentSequence
        local combinedTimes = helpers.collectColorSequenceTimes(startSequence, targetSequence)
        local startTime = tick()

        binding.sequenceConnection = RunService.RenderStepped:Connect(function()
            if not instance.Parent then
                binding.sequenceConnection:Disconnect()
                binding.sequenceConnection = nil
                return
            end

            local elapsed = tick() - startTime
            local alpha = math.clamp(elapsed / duration, 0, 1)
            local keypoints = table.create(#combinedTimes)

            for index, timePoint in ipairs(combinedTimes) do
                local fromColor = helpers.evaluateColorSequence(startSequence, timePoint)
                local toColor = helpers.evaluateColorSequence(targetSequence, timePoint)
                keypoints[index] = ColorSequenceKeypoint.new(timePoint, fromColor:Lerp(toColor, alpha))
            end

            instance[binding.property] = ColorSequence.new(keypoints)

            if alpha >= 1 then
                binding.sequenceConnection:Disconnect()
                binding.sequenceConnection = nil
                instance[binding.property] = targetSequence
            end
        end)
    end

    helpers.bind_theme = function(window, instance, property, themeKey, options)
        if not window._themeBindings then
            window._themeBindings = {}
        end

        if typeof(options) ~= "table" then
            options = { convert = options }
        end

        local tweenInfo = options.tweenInfo
        if not tweenInfo then
            local duration = options.duration or defaultThemeTweenInfo.Time
            local easingStyle = options.easingStyle or defaultThemeTweenInfo.EasingStyle
            local easingDirection = options.easingDirection or defaultThemeTweenInfo.EasingDirection
            tweenInfo = TweenInfo.new(duration, easingStyle, easingDirection)
        end

        local binding = {
            instance = instance,
            property = property,
            key = themeKey,
            convert = options.convert,
            tweenInfo = tweenInfo,
            animate = options.animate ~= false,
        }

        table.insert(window._themeBindings, binding)

        local interfaceRef = window.interface
        if interfaceRef and interfaceRef.theme then
            local value = interfaceRef.theme[themeKey]
            if value ~= nil then
                if binding.convert then
                    value = binding.convert(value)
                end
                instance[property] = value
            end
        end
    end

    if game:GetService('CoreGui'):FindFirstChild('ScreenGui2') then
        game:GetService('CoreGui'):FindFirstChild('ScreenGui2'):Destroy()
    end

    interface.screen_gui = helpers.new_instance('ScreenGui', {
        Name = 'ScreenGui2',
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = game:GetService('CoreGui'),
    })

    interface.default_theme = helpers.copy_table(default_theme)
    interface.theme = helpers.merge_settings(default_theme)

    function interface:_apply_theme_to_window(window)
        if not window._themeBindings then
            return
        end

        local theme = self.theme
        for _, binding in ipairs(window._themeBindings) do
            local instance = binding.instance
            if not instance or not instance.Parent then
                continue
            end

            local value = theme[binding.key]
            if value ~= nil then
                if binding.convert then
                    value = binding.convert(value)
                end
                if binding.animate ~= false and value ~= nil then
                    local valueType = typeof(value)
                    if valueType == "ColorSequence" then
                        helpers.animate_color_sequence(binding, value)
                    elseif valueType == "Color3" or valueType == "number" or valueType == "UDim" or valueType == "UDim2" or valueType == "Vector2" or valueType == "Vector3" then
                        if binding.activeTween then
                            binding.activeTween:Cancel()
                            binding.activeTween = nil
                        end
                        local tween = TweenService:Create(instance, binding.tweenInfo or defaultThemeTweenInfo, {
                            [binding.property] = value,
                        })
                        binding.activeTween = tween
                        tween.Completed:Connect(function(_, playbackState)
                            if playbackState ~= Enum.PlaybackState.Cancelled and binding.activeTween == tween then
                                binding.activeTween = nil
                            elseif playbackState == Enum.PlaybackState.Cancelled and binding.activeTween == tween then
                                binding.activeTween = nil
                            end
                        end)
                        tween:Play()
                    else
                        instance[binding.property] = value
                    end
                else
                    instance[binding.property] = value
                end
            end
        end

        if window._themeDependents then
            for _, callback in ipairs(window._themeDependents) do
                callback()
            end
        end
    end

    --[[
        Applies theme overrides to every instantiated window.

        Example:

            interface:set_theme({
                windowBackground = Color3.fromRGB(20, 20, 20),
                windowGradient = {
                    {0, Color3.fromRGB(255, 200, 200)},
                    {1, Color3.fromRGB(120, 60, 120)},
                },
            })

        ColorSequence entries can be provided either as ColorSequence values or as
        arrays of `{time, Color3}` or `{ time = 0.5, color = Color3.new(...) }`.
        Any omitted keys fall back to the bundled defaults. The change is applied live
        to all existing windows.
    ]]
    function interface:set_theme(theme_overrides)
        self.theme = helpers.merge_settings(default_theme, theme_overrides or {})
        for _, window in ipairs(self.windows) do
            self:_apply_theme_to_window(window)
        end
        for _, notification in ipairs(self.notifications) do
            if notification._themeHost then
                self:_apply_theme_to_window(notification._themeHost)
            end
        end
    end

    function interface:get_theme()
        return helpers.copy_table(self.theme)
    end

    function interface:_untrack_notification(target)
        for index, entry in ipairs(self.notifications) do
            if entry == target then
                table.remove(self.notifications, index)
                break
            end
        end
    end

    interface.new_notification = function(notification_settings)
        notification_settings = notification_settings or {}

        local notification_defaults = {
            title = 'Notification',
            message = '',
            icon = 'rbxassetid://126331057908253',
            position = 'top_right',
            duration = 4,
            permanent = false,
            buttons = {},
            width = 320,
        }

        local notification = helpers.merge_settings(notification_defaults, notification_settings)
        notification.buttons = notification.buttons or {}
        notification.width = math.clamp(notification.width or 320, 220, 420)

        local function resolve_position(position)
            if typeof(position) == "UDim2" then
                return position
            end

            local presets = {
                top_left = UDim2.new(0.2, 0, 0.2, 0),
                top_right = UDim2.new(0.8, 0, 0.2, 0),
                bottom_left = UDim2.new(0.2, 0, 0.8, 0),
                bottom_right = UDim2.new(0.8, 0, 0.8, 0),
                center = UDim2.new(0.5, 0, 0.5, 0),
            }

            return presets[position] or presets.top_right
        end

        local themeHost = {
            _themeBindings = {},
            _themeDependents = {},
            interface = interface,
        }

        notification._themeHost = themeHost
        notification._connections = {}
        notification._destroyed = false

        local targetPosition = resolve_position(notification.position)
        local container = helpers.new_instance('Frame', {
            Name = 'redwine_notification',
            Parent = interface.screen_gui,
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = targetPosition + UDim2.new(0, 0, 0, 20),
            Size = UDim2.new(0, notification.width, 0, 0),
            ZIndex = 15,
        })

        local shadow = helpers.new_instance('ImageLabel', {
            Parent = container,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = 'rbxassetid://128504410161229',
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = 0.84,
            Position = UDim2.new(0.5, 0, 0.5, 4),
            Size = UDim2.new(1, 16, 1, 16),
            ScaleType = Enum.ScaleType.Stretch,
            ZIndex = 14,
        })

        local card = helpers.new_instance('Frame', {
            Parent = container,
            AnchorPoint = Vector2.new(0.5, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = interface.theme.notificationBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0, 0),
            Size = UDim2.new(1, 0, 0, 0),
            ZIndex = 16,
        })

        local card_corner = helpers.new_instance('UICorner', {
            Parent = card,
            CornerRadius = UDim.new(0, 6),
        })

        local card_gradient = helpers.new_instance('UIGradient', {
            Parent = card,
            Color = helpers.toColorSequence(interface.theme.notificationGradient),
            Rotation = 90,
        })

        helpers.bind_theme(themeHost, card, 'BackgroundColor3', 'notificationBackground')
        helpers.bind_theme(themeHost, card_gradient, 'Color', 'notificationGradient', {
            convert = helpers.toColorSequence,
        })

        local card_stroke = helpers.new_instance('UIStroke', {
            Parent = card,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = interface.theme.notificationStroke,
            Thickness = 1,
            Transparency = 0.32,
        })

        local card_highlight = helpers.new_instance('UIStroke', {
            Parent = card,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            Color = interface.theme.notificationHighlightStroke,
            Thickness = 2,
            Transparency = 0.86,
        })

        helpers.bind_theme(themeHost, card_stroke, 'Color', 'notificationStroke')
        helpers.bind_theme(themeHost, card_highlight, 'Color', 'notificationHighlightStroke')

        local padding = helpers.new_instance('UIPadding', {
            Parent = card,
            PaddingTop = UDim.new(0, 18),
            PaddingBottom = UDim.new(0, 18),
            PaddingLeft = UDim.new(0, 18),
            PaddingRight = UDim.new(0, 18),
        })

        local contentColumn = helpers.new_instance('Frame', {
            Parent = card,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            ZIndex = 17,
        })

        local columnLayout = helpers.new_instance('UIListLayout', {
            Parent = contentColumn,
            Padding = UDim.new(0, 10),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        })

        local headerRow = helpers.new_instance('Frame', {
            Parent = contentColumn,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 0),
        })

        local headerLayout = helpers.new_instance('UIListLayout', {
            Parent = headerRow,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
        })

        local iconHolder = helpers.new_instance('ImageLabel', {
            Parent = headerRow,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(0, 32, 0, 32),
            Image = notification.icon or '',
            ImageColor3 = interface.theme.notificationIconColor,
            ScaleType = Enum.ScaleType.Fit,
        })

        helpers.bind_theme(themeHost, iconHolder, 'ImageColor3', 'notificationIconColor')

        iconHolder.Visible = (notification.icon ~= nil and notification.icon ~= '')
        if not iconHolder.Visible then
            iconHolder.Size = UDim2.new(0, 0, 0, 0)
        end

        local titleLabel = helpers.new_instance('TextLabel', {
            Parent = headerRow,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Text = tostring(notification.title or ''),
            TextColor3 = interface.theme.notificationTitleText,
            TextSize = 16,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            Size = UDim2.new(1, -42, 0, 0),
        })

        local titleGradient = helpers.new_instance('UIGradient', {
            Parent = titleLabel,
            Color = helpers.toColorSequence(interface.theme.notificationTitleGradient),
            Rotation = 90,
        })

        local titleStroke = helpers.new_instance('UIStroke', {
            Parent = titleLabel,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            Color = interface.theme.notificationTitleStroke,
            Thickness = 1.5,
            Transparency = 0.92,
        })

        helpers.bind_theme(themeHost, titleLabel, 'TextColor3', 'notificationTitleText')
        helpers.bind_theme(themeHost, titleGradient, 'Color', 'notificationTitleGradient', {
            convert = helpers.toColorSequence,
        })
        helpers.bind_theme(themeHost, titleStroke, 'Color', 'notificationTitleStroke')

        local messageLabel = helpers.new_instance('TextLabel', {
            Parent = contentColumn,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Text = tostring(notification.message or ''),
            TextColor3 = interface.theme.notificationMessageText,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
        })

        local messageGradient = helpers.new_instance('UIGradient', {
            Parent = messageLabel,
            Color = helpers.toColorSequence(interface.theme.notificationMessageGradient),
            Rotation = 90,
        })

        local messageStroke = helpers.new_instance('UIStroke', {
            Parent = messageLabel,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            Color = interface.theme.notificationMessageStroke,
            Thickness = 1,
            Transparency = 0.94,
        })

        helpers.bind_theme(themeHost, messageLabel, 'TextColor3', 'notificationMessageText')
        helpers.bind_theme(themeHost, messageGradient, 'Color', 'notificationMessageGradient', {
            convert = helpers.toColorSequence,
        })
        helpers.bind_theme(themeHost, messageStroke, 'Color', 'notificationMessageStroke')

        local buttonRow = helpers.new_instance('Frame', {
            Parent = contentColumn,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0, 0),
            Visible = (#notification.buttons > 0),
        })

        local buttonPadding = helpers.new_instance('UIPadding', {
            Parent = buttonRow,
            PaddingTop = UDim.new(0, 4),
        })

        local buttonLayout = helpers.new_instance('UIListLayout', {
            Parent = buttonRow,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        })

        local close_button = helpers.new_instance('ImageButton', {
            Parent = container,
            AnchorPoint = Vector2.new(1, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(1, -10, 0, 10),
            Size = UDim2.new(0, 20, 0, 20),
            Image = 'rbxassetid://110297980326935',
            ImageColor3 = interface.theme.controlIconColor,
            AutoButtonColor = false,
            ZIndex = 20,
        })

        helpers.bind_theme(themeHost, close_button, 'ImageColor3', 'controlIconColor')

        local function track_connection(conn)
            if conn then
                table.insert(notification._connections, conn)
            end
        end

        track_connection(close_button.MouseButton1Click:Connect(function()
            notification:destroy()
        end))

        local buttonStateKeys = {
            inactive = 'textButtonBackgroundInactive',
            hover = 'textButtonBackgroundHover',
            press = 'textButtonBackgroundPress',
            active = 'textButtonBackgroundActive',
        }

        local function apply_button_state(button, state, instant)
            local key = buttonStateKeys[state] or buttonStateKeys.inactive
            local themeSnapshot = interface.theme
            local targetColor = themeSnapshot[key] or button.BackgroundColor3
            if instant then
                button.BackgroundColor3 = targetColor
                return
            end
            helpers.tween_object(
                button,
                {
                    BackgroundColor3 = targetColor,
                },
                0.18,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.Out
            )
        end

        for index, buttonDefinition in ipairs(notification.buttons) do
            local button = helpers.new_instance('TextButton', {
                Parent = buttonRow,
                AnchorPoint = Vector2.new(0, 0.5),
                AutoButtonColor = false,
                BackgroundColor3 = interface.theme.textButtonBackgroundInactive,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                LayoutOrder = index,
                Size = UDim2.new(0, buttonDefinition.width or 96, 0, 28),
                FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
                Text = tostring(buttonDefinition.text or buttonDefinition.label or ('Option ' .. index)),
                TextColor3 = interface.theme.textButtonTextColor,
                TextSize = 13,
                TextWrapped = true,
                ZIndex = 18,
            })

            helpers.bind_theme(themeHost, button, 'TextColor3', 'textButtonTextColor')

            local buttonGradient = helpers.new_instance('UIGradient', {
                Parent = button,
                Color = helpers.toColorSequence(interface.theme.textButtonGradient),
                Rotation = 90,
            })

            local buttonStroke = helpers.new_instance('UIStroke', {
                Parent = button,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = interface.theme.textButtonStroke,
                Thickness = 1,
                Transparency = 0.42,
            })

            helpers.bind_theme(themeHost, buttonGradient, 'Color', 'textButtonGradient', {
                convert = helpers.toColorSequence,
            })
            helpers.bind_theme(themeHost, buttonStroke, 'Color', 'textButtonStroke')

            apply_button_state(button, 'inactive', true)

            track_connection(button.MouseEnter:Connect(function()
                apply_button_state(button, 'hover')
            end))

            track_connection(button.MouseLeave:Connect(function()
                apply_button_state(button, 'inactive')
            end))

            track_connection(button.MouseButton1Down:Connect(function()
                apply_button_state(button, 'press')
            end))

            track_connection(button.MouseButton1Up:Connect(function()
                apply_button_state(button, 'hover')
            end))

            track_connection(button.MouseButton1Click:Connect(function()
                if typeof(buttonDefinition.callback) == 'function' then
                    task.spawn(buttonDefinition.callback, notification)
                end
                if buttonDefinition.dismissOnClick ~= false then
                    notification:destroy()
                end
            end))
        end

        notification._container = container
        notification._card = card
        notification._targetPosition = targetPosition
        notification._strokeBindings = {
            { object = card_stroke, target = card_stroke.Transparency },
            { object = card_highlight, target = card_highlight.Transparency },
        }

        card_stroke.Transparency = 1
        card_highlight.Transparency = 1

        interface:_apply_theme_to_window(themeHost)
        table.insert(interface.notifications, notification)

        local function cancel_thread(thread)
            if thread then
                task.cancel(thread)
            end
        end

        function notification:destroy()
            if self._destroyed then
                return
            end
            self._destroyed = true

            cancel_thread(self._dismissThread)
            self._dismissThread = nil

            for _, conn in ipairs(self._connections) do
                if conn then
                    conn:Disconnect()
                end
            end
            self._connections = {}

            interface:_untrack_notification(self)

            helpers.tween_object(
                self._container,
                {
                    Position = self._targetPosition + UDim2.new(0, 0, 0, 24),
                },
                0.24,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.In
            )

            helpers.tween_object(
                self._card,
                {
                    BackgroundTransparency = 1,
                },
                0.24,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.In
            )

            for _, strokeData in ipairs(self._strokeBindings) do
                helpers.tween_object(
                    strokeData.object,
                    {
                        Transparency = 1,
                    },
                    0.24,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.In
                )
            end

            task.delay(0.26, function()
                if self._container and self._container.Parent then
                    self._container:Destroy()
                end
                self._card = nil
                self._container = nil
            end)
        end

        if not notification.permanent and notification.duration > 0 then
            notification._dismissThread = task.delay(notification.duration, function()
                notification:destroy()
            end)
        end

        task.defer(function()
            helpers.tween_object(
                container,
                {
                    Position = targetPosition,
                },
                0.32,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )

            helpers.tween_object(
                card,
                {
                    BackgroundTransparency = 0,
                },
                0.24,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.Out
            )

            for _, strokeData in ipairs(notification._strokeBindings) do
                helpers.tween_object(
                    strokeData.object,
                    {
                        Transparency = strokeData.target,
                    },
                    0.28,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.Out
                )
            end
        end)

        return notification
    end

    interface.new_window = function(window_settings)
        window_settings = window_settings or {}

        local window_defaults = {
            title = 'redwine',
            icon = 'rbxassetid://126331057908253',
            type = 'single_section',
            width = 500,
            height = 250,
            position = 'center',
            visible = true,
            is_minimized = false,
            content = {},
        }

        local window = helpers.merge_settings(window_defaults, window_settings)
        window.content = window.content or {}
        window.interface = interface
        window._themeBindings = {}
        window._themeDependents = {}

        function window:_register_theme_dependent(callback)
            table.insert(self._themeDependents, callback)
        end

        local theme = interface.theme

        local function resolvePosition(position)
            local positions = {
                center = UDim2.new(0.5, 0, 0.25, 0),
                top_left = UDim2.new(0.25, 0, 0.32, 0),
                top_right = UDim2.new(0.75, 0, 0.32, 0),
                bottom_left = UDim2.new(0.25, 0, 0.64, 0),
                bottom_right = UDim2.new(0.75, 0, 0.64, 0),
            }

            return positions[position] or positions.center
        end

        local resolvedPosition = resolvePosition(window.position)
        local entranceOffset = UDim2.new(0, 0, 0, 16)
        local targetWindowSize = UDim2.new(
            0,
            window.width,
            0,
            (window.is_minimized and 32 or window.height)
        )

        window.main = helpers.new_instance('Frame', {
            Parent = interface.screen_gui,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = theme.windowBackground,
            BorderSizePixel = 0,
            Position = resolvedPosition + entranceOffset,
            Size = targetWindowSize,
            Visible = window.visible,
        })

        helpers.bind_theme(window, window.main, "BackgroundColor3", "windowBackground")

        local startup_scale = helpers.new_instance('UIScale', {
            Parent = window.main,
            Scale = 0.964,
        })

        local targetBackgroundTransparency = window.main.BackgroundTransparency
        window.main.BackgroundTransparency = 1

        local main_corner = helpers.new_instance('UICorner', {
            Parent = window.main,
            CornerRadius = UDim.new(0, 4),
        })

        local main_stroke1 = helpers.new_instance('UIStroke', {
            Parent = window.main,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = theme.windowStrokePrimary,
            Thickness = 1.16,
            Transparency = 0,
        })

        helpers.bind_theme(window, main_stroke1, "Color", "windowStrokePrimary")

        local stroke1TargetTransparency = main_stroke1.Transparency
        main_stroke1.Transparency = 1

        local main_stroke2 = helpers.new_instance('UIStroke', {
            Parent = window.main,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            BorderOffset = UDim.new(0, 1),
            Color = theme.windowStrokeSecondary,
            Thickness = 1,
            Transparency = 0.64,
        })

        helpers.bind_theme(window, main_stroke2, "Color", "windowStrokeSecondary")

        local stroke2TargetTransparency = main_stroke2.Transparency
        main_stroke2.Transparency = 1

        local main_gradient = helpers.new_instance('UIGradient', {
            Parent = window.main,
            Color = helpers.toColorSequence(theme.windowGradient),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0.000, 0.008),
                NumberSequenceKeypoint.new(0.601, 0.016),
                NumberSequenceKeypoint.new(1.000, 0.032),
            }),
            Rotation = 90,
        })

        helpers.bind_theme(window, main_gradient, "Color", "windowGradient", {
            convert = helpers.toColorSequence,
        })

        local main_imagelabel = helpers.new_instance('ImageLabel', {
            Parent = window.main,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(1, 0, 1, 0),
            Image = 'rbxassetid://128504410161229',
            ImageColor3 = theme.windowTexturePrimary,
            ScaleType = Enum.ScaleType.Stretch,
        })

        helpers.bind_theme(window, main_imagelabel, "ImageColor3", "windowTexturePrimary")

        local textureTargetTransparency = main_imagelabel.ImageTransparency
        main_imagelabel.ImageTransparency = 1

        local image_label_corner = helpers.new_instance('UICorner', {
            Parent = main_imagelabel,
            CornerRadius = UDim.new(0, 4),
        })

        local topbar_container = helpers.new_instance('Frame', {
            Parent = window.main,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = theme.topbarBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0, 0),
            Size = UDim2.new(1, 0, 0, 32),
        })

        helpers.bind_theme(window, topbar_container, "BackgroundColor3", "topbarBackground")

        -- basic drag handler so the topbar moves the entire window
        local dragging = false
        local dragInput
        local dragStart
        local startPos
        local inputChangedConn
        local activeDragTween
        local activeContentTween

        local function endDrag()
            dragging = false
            dragInput = nil
            if inputChangedConn then
                inputChangedConn:Disconnect()
                inputChangedConn = nil
            end
        end

        local function updateDrag(input)
            local delta = input.Position - dragStart
            if activeDragTween then
                activeDragTween:Cancel()
            end

            if window._startupTween then
                window._startupTween:Cancel()
                window._startupTween = nil
                window.main.BackgroundTransparency = targetBackgroundTransparency
                startup_scale.Scale = 1
                main_stroke1.Transparency = stroke1TargetTransparency
                main_stroke2.Transparency = stroke2TargetTransparency
                main_imagelabel.ImageTransparency = textureTargetTransparency
            end

            local tween = helpers.tween_object(
                window.main,
                {
                    Position = UDim2.new(
                        startPos.X.Scale,
                        startPos.X.Offset + delta.X,
                        startPos.Y.Scale,
                        startPos.Y.Offset + delta.Y
                    ),
                },
                0.16,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )
            activeDragTween = tween
            tween.Completed:Connect(function()
                if activeDragTween == tween then
                    activeDragTween = nil
                end
            end)
        end

        topbar_container.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = window.main.Position

                if not inputChangedConn then
                    inputChangedConn = UserInputService.InputChanged:Connect(function(changedInput)
                        if changedInput == dragInput and dragging then
                            task.spawn(updateDrag, changedInput)
                        end
                    end)
                end

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        endDrag()
                    end
                end)
            end
        end)

        topbar_container.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        topbar_container.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                endDrag()
            end
        end)

        local topbar_padding = helpers.new_instance('UIPadding', {
            Parent = topbar_container,
            PaddingRight = UDim.new(0, 6),
        })

        local topbar_title = helpers.new_instance('TextLabel', {
            Parent = topbar_container,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 32, 0.5, 0),
            Size = UDim2.new(1, -128, 1, 0),
            FontFace = Font.new(
                'rbxassetid://12187365364',
                Enum.FontWeight.Medium,
                Enum.FontStyle.Normal
            ),
            Text = window.title,
            TextColor3 = theme.topbarTitleText,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
        })

        helpers.bind_theme(window, topbar_title, "TextColor3", "topbarTitleText")

        local title_gradient = helpers.new_instance('UIGradient', {
            Parent = topbar_title,
            Color = helpers.toColorSequence(theme.topbarTitleGradient),
            Rotation = 90,
        })

        helpers.bind_theme(window, title_gradient, "Color", "topbarTitleGradient", {
            convert = helpers.toColorSequence,
        })

        local title_stroke = helpers.new_instance('UIStroke', {
            Parent = topbar_title,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            Color = theme.topbarTitleStroke,
            Thickness = 2,
            Transparency = 0.864,
        })

        helpers.bind_theme(window, title_stroke, "Color", "topbarTitleStroke")

        local window_icon = helpers.new_instance('ImageLabel', {
            Parent = topbar_container,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 16, 0.5, 0),
            Size = UDim2.new(0, 20, 0, 20),
            Image = window.icon,
            ImageColor3 = theme.windowIconColor,
            ScaleType = Enum.ScaleType.Fit,
        })

        helpers.bind_theme(window, window_icon, "ImageColor3", "windowIconColor")

        local icon_gradient = helpers.new_instance('UIGradient', {
            Parent = window_icon,
            Color = helpers.toColorSequence(theme.windowIconGradient),
            Rotation = 90,
        })

        helpers.bind_theme(window, icon_gradient, "Color", "windowIconGradient", {
            convert = helpers.toColorSequence,
        })

        local minimize_button = helpers.new_instance('ImageButton', {
            Parent = topbar_container,
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(1, 0, 0.5, 0),
            Size = UDim2.new(0, 20, 0, 20),
            Image = "rbxassetid://110297980326935",
            ImageColor3 = theme.controlIconColor,
            ScaleType = Enum.ScaleType.Fit,
            AutoButtonColor = false,
            Rotation = (window.is_minimized and 90 or 0),
        })

        helpers.bind_theme(window, minimize_button, "ImageColor3", "controlIconColor")

        local contentExpandedSize = UDim2.new(1, 0, 1, -32)
        local contentCollapsedSize = UDim2.new(1, 0, 0, 0)

        local content_container = helpers.new_instance('Frame', {
            Parent = window.main,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = theme.contentBackground,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0, 32),
            Size = (window.is_minimized and contentCollapsedSize or contentExpandedSize),
            ClipsDescendants = true,
        })

        helpers.bind_theme(window, content_container, "BackgroundColor3", "contentBackground")

        minimize_button.MouseButton1Click:Connect(function()
            if window._startupTween then
                window._startupTween:Cancel()
                window._startupTween = nil
                window.main.BackgroundTransparency = targetBackgroundTransparency
                startup_scale.Scale = 1
                main_stroke1.Transparency = stroke1TargetTransparency
                main_stroke2.Transparency = stroke2TargetTransparency
                main_imagelabel.ImageTransparency = textureTargetTransparency
            end

            window.is_minimized = not window.is_minimized

            helpers.tween_object(
                minimize_button,
                {
                    Rotation = (window.is_minimized and 90 or 0),
                },
                0.64,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.InOut
            )

            task.wait(0.16)

            helpers.tween_object(
                window.main,
                {
                    Size = UDim2.new(
                        0,
                        window.width,
                        0,
                        (window.is_minimized and 32 or window.height)
                    ),
                },
                0.64,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.InOut
            )

            local targetContentSize = window.is_minimized and contentCollapsedSize or contentExpandedSize

            if activeContentTween then
                activeContentTween:Cancel()
                activeContentTween = nil
            end

            local contentTween = helpers.tween_object(
                content_container,
                {
                    Size = targetContentSize,
                },
                0.64,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.InOut
            )

            activeContentTween = contentTween

            if window.is_minimized then
                local conn
                conn = contentTween.Completed:Connect(function(_, playbackState)
                    if activeContentTween == contentTween then
                        activeContentTween = nil
                    end
                    if conn then
                        conn:Disconnect()
                    end
                end)
            else
                contentTween.Completed:Connect(function(_, playbackState)
                    if activeContentTween == contentTween then
                        activeContentTween = nil
                    end
                end)
            end
        end)

        local content_container_padding = helpers.new_instance('UIPadding', {
            Parent = content_container,
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 6),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
        })

        local content_frame = helpers.new_instance('Frame', {
            Parent = content_container,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = theme.contentFrameBackground,
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(1, 0, 1, 0),
        })

        helpers.bind_theme(window, content_frame, "BackgroundColor3", "contentFrameBackground")

        local cframe_corner = helpers.new_instance('UICorner', {
            Parent = content_frame,
            CornerRadius = UDim.new(0, 4),
        })

        local cframe_padding = helpers.new_instance('UIPadding', {
            Parent = content_frame,
            PaddingTop = UDim.new(0, 6),
            PaddingBottom = UDim.new(0, 6),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6),
        })

        -- this stroke duo creates a nice softened border without leaning too heavy on outer borders
        local cframe_stroke1 = helpers.new_instance('UIStroke', {
            Parent = content_frame,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            BorderStrokePosition = Enum.BorderStrokePosition.Center,
            Color = theme.contentFrameStroke,
            Thickness = 1,
            Transparency = 0.64,
        })

        helpers.bind_theme(window, cframe_stroke1, "Color", "contentFrameStroke")

        -- same as stroke 1 but inner border
        local cframe_stroke2 = helpers.new_instance('UIStroke', {
            Parent = content_frame,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
            Color = theme.contentFrameStroke,
            Thickness = 1,
            Transparency = 0.64,
        })

        helpers.bind_theme(window, cframe_stroke2, "Color", "contentFrameStroke")

        local function play_startup_animation()
            if not window.visible then
                window.main.Position = resolvedPosition
                window.main.BackgroundTransparency = targetBackgroundTransparency
                startup_scale.Scale = 1
                main_stroke1.Transparency = stroke1TargetTransparency
                main_stroke2.Transparency = stroke2TargetTransparency
                main_imagelabel.ImageTransparency = textureTargetTransparency
                window._startupTween = nil
                return
            end

            local entranceTween = helpers.tween_object(
                window.main,
                {
                    Position = resolvedPosition,
                    BackgroundTransparency = targetBackgroundTransparency,
                },
                0.16,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )

            window._startupTween = entranceTween
            entranceTween.Completed:Connect(function(_, playbackState)
                if playbackState ~= Enum.PlaybackState.Cancelled and window._startupTween == entranceTween then
                    window._startupTween = nil
                elseif playbackState == Enum.PlaybackState.Cancelled and window._startupTween == entranceTween then
                    window._startupTween = nil
                end
            end)

            helpers.tween_object(
                startup_scale,
                {
                    Scale = 1,
                },
                0.64,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )

            helpers.tween_object(
                main_stroke1,
                {
                    Transparency = stroke1TargetTransparency,
                },
                0.16,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )

            helpers.tween_object(
                main_stroke2,
                {
                    Transparency = stroke2TargetTransparency,
                },
                0.16,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )

            helpers.tween_object(
                main_imagelabel,
                {
                    ImageTransparency = textureTargetTransparency,
                },
                0.16,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            )
        end

        task.defer(play_startup_animation)

        window.tab_control = function()
            local tab_control = {}
            tab_control.container = helpers.new_instance('Frame', {
                Parent = content_frame,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 1, 0),
            })

            local tab_buttons = helpers.new_instance('Frame', {
                Parent = tab_control.container,
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = theme.tabBarBackground,
                BackgroundTransparency = 0.75,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0, 0),
                Size = UDim2.new(1, 0, 0, 32),
            })

            helpers.bind_theme(window, tab_buttons, "BackgroundColor3", "tabBarBackground")

            local tab_buttons_corner = helpers.new_instance('UICorner', {
                Parent = tab_buttons,
                CornerRadius = UDim.new(0, 4),
            })

            local tab_buttons_padding = helpers.new_instance('UIPadding', {
                Parent = tab_buttons,
                PaddingTop = UDim.new(0, 6),
                PaddingBottom = UDim.new(0, 6),
                PaddingLeft = UDim.new(0, 6),
                PaddingRight = UDim.new(0, 6),
            })

            local tab_buttons_stroke1 = helpers.new_instance('UIStroke', {
                Parent = tab_buttons,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                BorderStrokePosition = Enum.BorderStrokePosition.Center,
                Color = theme.tabBarStroke,
                Thickness = 1,
                Transparency = 0.64,
            })

            helpers.bind_theme(window, tab_buttons_stroke1, "Color", "tabBarStroke")

            local tab_buttons_stroke2 = helpers.new_instance('UIStroke', {
                Parent = tab_buttons,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = theme.tabBarStroke,
                Thickness = 1,
                Transparency = 0.64,
            })

            helpers.bind_theme(window, tab_buttons_stroke2, "Color", "tabBarStroke")

            local tab_button_container = helpers.new_instance('ScrollingFrame', {
                Parent = tab_buttons,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.new(1, 0, 1, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.X,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollBarThickness = 0,
                ScrollingDirection = Enum.ScrollingDirection.X,
            })
            
            local tab_button_container_layout = helpers.new_instance('UIListLayout', {
                Parent = tab_button_container,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6),
            })

            local page_container = helpers.new_instance('Frame', {
                Parent = tab_control.container,
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.5, 0, 0, 32),
                Size = UDim2.new(1, 0, 1, -32),
            })

            local page_container_padding = helpers.new_instance('UIPadding', {
                Parent = page_container,
                PaddingTop = UDim.new(0, 6)
            })

            local PAGE_CENTER = UDim2.new(0.5, 0, 0.5, 0)
            local PAGE_LEFT = UDim2.new(-6, 0, 0.5, 0)
            local PAGE_RIGHT = UDim2.new(6, 0, 0.5, 0)
            local PAGE_TWEEN_DURATION = 1.28

            tab_control.tabs = {
                active_tab = nil,
                all = {}
            }

            function tab_control:set_active_tab(target_tab, instant)
                if not target_tab then
                    return
                end

                local previous = self.tabs.active_tab

                if previous == target_tab then
                    if instant then
                        if target_tab.pageTween then
                            target_tab.pageTween:Cancel()
                            target_tab.pageTween = nil
                        end
                        target_tab.page.Position = PAGE_CENTER
                    end
                    target_tab.page.Visible = true
                    target_tab:_apply_style("active", instant)
                    return
                end

                if previous then
                    if previous.pageTween then
                        previous.pageTween:Cancel()
                        previous.pageTween = nil
                    end

                    previous.page.Visible = true

                    if not instant then
                        local exitTween = helpers.tween_object(
                            previous.page,
                            {
                                Position = PAGE_LEFT,
                            },
                            PAGE_TWEEN_DURATION,
                            Enum.EasingStyle.Quart,
                            Enum.EasingDirection.Out
                        )

                        previous.pageTween = exitTween
                        exitTween.Completed:Connect(function(_, playbackState)
                            if previous.pageTween == exitTween then
                                previous.pageTween = nil
                            end
                            if playbackState ~= Enum.PlaybackState.Cancelled then
                                previous.page.Visible = false
                                local stageTween = helpers.tween_object(
                                    previous.page,
                                    {
                                        Position = PAGE_RIGHT,
                                    },
                                    PAGE_TWEEN_DURATION,
                                    Enum.EasingStyle.Quart,
                                    Enum.EasingDirection.Out
                                )
                                previous.pageTween = stageTween
                                stageTween.Completed:Connect(function(_, stageState)
                                    if previous.pageTween == stageTween then
                                        previous.pageTween = nil
                                    end
                                end)
                            end
                        end)
                    else
                        previous.page.Position = PAGE_RIGHT
                        previous.page.Visible = false
                    end

                    if previous.isHovering then
                        previous:_apply_style("hover", instant)
                    else
                        previous:_apply_style("inactive", instant)
                    end
                end

                self.tabs.active_tab = target_tab

                if target_tab.pageTween then
                    target_tab.pageTween:Cancel()
                    target_tab.pageTween = nil
                end

                target_tab.page.Visible = true
                if not instant then
                    target_tab.page.Position = PAGE_RIGHT
                end
                if instant or not previous then
                    target_tab.page.Position = PAGE_CENTER
                else
                    local entranceTween = helpers.tween_object(
                        target_tab.page,
                        {
                            Position = PAGE_CENTER,
                        },
                        PAGE_TWEEN_DURATION,
                        Enum.EasingStyle.Quart,
                        Enum.EasingDirection.Out
                    )
                    target_tab.pageTween = entranceTween
                    entranceTween.Completed:Connect(function(_, playbackState)
                        if target_tab.pageTween == entranceTween then
                            target_tab.pageTween = nil
                        end
                        if playbackState ~= Enum.PlaybackState.Cancelled then
                            target_tab.page.Position = PAGE_CENTER
                        end
                    end)
                end

                target_tab:_apply_style("active", instant)
            end

            tab_control.new_tab = function(tab_settings)
                tab_settings = tab_settings or {}

                local tab_defaults = {
                    title = 'Tab',
                    page_type = 'single_section',
                    default = false,
                }

                local tab = helpers.merge_settings(tab_defaults, tab_settings)
                tab.title = tab.title or 'Tab'
                tab.default = tab.default or false
                tab.page_type = tab.page_type or 'single_section'

                tab.button = helpers.new_instance('TextButton', {
                    Parent = tab_button_container,
                    AnchorPoint = Vector2.new(0, 0.5),
                    AutoButtonColor = false,
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = theme.tabButtonBackgroundInactive,
                    BackgroundTransparency = 0.75,
                    BorderSizePixel = 0,
                    Name = tab.title .. '_tab_button',
                    Size = UDim2.new(0, 64, 0, 20),
                    FontFace = Font.new(
                        'rbxassetid://12187365364',
                        Enum.FontWeight.Medium,
                        Enum.FontStyle.Normal
                    ),
                    Text = tab.title,
                    TextColor3 = theme.tabButtonTextColor,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                })

                helpers.bind_theme(window, tab.button, "TextColor3", "tabButtonTextColor")

                tab.button_padding = helpers.new_instance('UIPadding', {
                    Parent = tab.button,
                    PaddingLeft = UDim.new(0, 12),
                    PaddingRight = UDim.new(0, 12),
                })

                helpers.new_instance('UICorner', {
                    Parent = tab.button,
                    CornerRadius = UDim.new(0, 4),
                })

                local tab_button_gradient = helpers.new_instance('UIGradient', {
                    Parent = tab.button,
                    Color = helpers.toColorSequence(theme.tabButtonGradient),
                    Rotation = 90,
                })

                helpers.bind_theme(window, tab_button_gradient, "Color", "tabButtonGradient", {
                    convert = helpers.toColorSequence,
                })

                local tab_button_stroke1 = helpers.new_instance('UIStroke', {
                    Parent = tab.button,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderStrokePosition = Enum.BorderStrokePosition.Center,
                    Color = theme.tabButtonStroke,
                    Thickness = 1,
                    Transparency = 0.64,
                })

                helpers.bind_theme(window, tab_button_stroke1, "Color", "tabButtonStroke")

                local tab_button_stroke2 = helpers.new_instance('UIStroke', {
                    Parent = tab.button,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                    Color = theme.tabButtonStroke,
                    Thickness = 1,
                    Transparency = 0.64,
                })

                helpers.bind_theme(window, tab_button_stroke2, "Color", "tabButtonStroke")

                local tab_button_highlight = helpers.new_instance('UIStroke', {
                    Parent = tab.button,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    Color = theme.tabButtonHighlightStroke,
                    Thickness = 2,
                    Transparency = 0.864,
                })

                helpers.bind_theme(window, tab_button_highlight, "Color", "tabButtonHighlightStroke")

                tab.page = helpers.new_instance('ScrollingFrame', {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Parent = page_container,
                    Position = PAGE_RIGHT,
                    Size = UDim2.new(1, 0, 1, 0),
                    ClipsDescendants = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ScrollBarThickness = 0,
                    ScrollBarImageTransparency = 1,
                    ScrollingDirection = Enum.ScrollingDirection.Y,
                })

                helpers.new_instance('UICorner', {
                    Parent = tab.page,
                    CornerRadius = UDim.new(0, 4),
                })

                local tab_page_stroke1 = helpers.new_instance('UIStroke', {
                    Parent = tab.page,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderStrokePosition = Enum.BorderStrokePosition.Center,
                    Color = theme.tabButtonStroke,
                    Thickness = 1,
                    Transparency = 0.64,
                })

                helpers.bind_theme(window, tab_page_stroke1, "Color", "tabButtonStroke")

                local tab_page_stroke2 = helpers.new_instance('UIStroke', {
                    Parent = tab.page,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                    Color = theme.tabButtonStroke,
                    Thickness = 1,
                    Transparency = 0.64,
                })
                
                helpers.bind_theme(window, tab_page_stroke2, "Color", "tabButtonStroke")

                tab.page.Position = PAGE_RIGHT
                tab.isHovering = false

                local backgroundKeys = {
                    inactive = "tabButtonBackgroundInactive",
                    hover = "tabButtonBackgroundHover",
                    active = "tabButtonBackgroundActive",
                    press = "tabButtonBackgroundPress",
                }

                local fontWeights = {
                    inactive = Enum.FontWeight.Medium,
                    hover = Enum.FontWeight.SemiBold,
                    active = Enum.FontWeight.Bold,
                    press = Enum.FontWeight.Bold,
                }

                local horizontalPadding = {
                    inactive = 10,
                    hover = 12,
                    active = 16,
                    press = 14,
                }

                function tab:_apply_style(state, instant)
                    self.state = state
                    local themeSnapshot = window.interface.theme
                    local backgroundKey = backgroundKeys[state] or backgroundKeys.inactive
                    local fontWeight = fontWeights[state] or fontWeights.inactive
                    local paddingValue = horizontalPadding[state] or horizontalPadding.inactive
                    local targetBackground = themeSnapshot[backgroundKey] or themeSnapshot[backgroundKeys.inactive] or self.button.BackgroundColor3
                    local targetPadding = UDim.new(0, paddingValue)
                    local targetPaddingTop = UDim.new(0, state == "press" and 4 or 0)

                    local function cancel_tween(field)
                        if self[field] then
                            self[field]:Cancel()
                            self[field] = nil
                        end
                    end

                    if instant then
                        cancel_tween('_styleTweenBackground')
                        cancel_tween('_styleTweenPaddingLeft')
                        cancel_tween('_styleTweenPaddingRight')
                        cancel_tween('_styleTweenPaddingTop')

                        self.button.BackgroundColor3 = targetBackground
                        self.button_padding.PaddingLeft = targetPadding
                        self.button_padding.PaddingRight = targetPadding
                        self.button_padding.PaddingTop = targetPaddingTop
                    else
                        local function tween_property(field, instance, property, value)
                            cancel_tween(field)
                            local tween = helpers.tween_object(
                                instance,
                                {
                                    [property] = value,
                                },
                                0.32,
                                Enum.EasingStyle.Quart,
                                Enum.EasingDirection.Out
                            )
                            self[field] = tween
                            tween.Completed:Connect(function(_, playbackState)
                                if playbackState ~= Enum.PlaybackState.Cancelled and self[field] == tween then
                                    self[field] = nil
                                elseif playbackState == Enum.PlaybackState.Cancelled and self[field] == tween then
                                    self[field] = nil
                                end
                            end)
                        end

                        tween_property('_styleTweenBackground', self.button, 'BackgroundColor3', targetBackground)
                        tween_property('_styleTweenPaddingLeft', self.button_padding, 'PaddingLeft', targetPadding)
                        tween_property('_styleTweenPaddingRight', self.button_padding, 'PaddingRight', targetPadding)
                        tween_property('_styleTweenPaddingTop', self.button_padding, 'PaddingTop', targetPaddingTop)
                    end

                    self.button.FontFace = Font.new(
                        'rbxassetid://12187365364',
                        fontWeight,
                        Enum.FontStyle.Normal
                    )
                end

                tab:_apply_style("inactive", true)

                local function apply_hover_state()
                    if tab_control.tabs.active_tab == tab then
                        tab:_apply_style("active")
                    else
                        tab:_apply_style("hover")
                    end
                end

                tab.button.MouseEnter:Connect(function()
                    tab.isHovering = true
                    apply_hover_state()
                end)

                tab.button.MouseLeave:Connect(function()
                    tab.isHovering = false
                    if tab_control.tabs.active_tab == tab then
                        tab:_apply_style("active")
                    else
                        tab:_apply_style("inactive")
                    end
                end)

                tab.button.MouseButton1Down:Connect(function()
                    tab:_apply_style("press")
                end)

                tab.button.MouseButton1Up:Connect(function()
                    if tab_control.tabs.active_tab == tab then
                        tab:_apply_style("active")
                    elseif tab.isHovering then
                        tab:_apply_style("hover")
                    else
                        tab:_apply_style("inactive")
                    end
                end)

                tab.button.MouseButton1Click:Connect(function()
                    tab_control:set_active_tab(tab)
                end)

                window:_register_theme_dependent(function()
                    tab:_apply_style(tab.state or "inactive", true)
                end)

                table.insert(tab_control.tabs.all, tab)

                if tab_control.tabs.active_tab == nil or tab.default then
                    tab_control:set_active_tab(tab, true)
                else
                    tab:_apply_style("inactive", true)
                end
                
                tab.containers = {}
                tab.containers[1] = helpers.new_instance('Frame', {
                    Parent = tab.page,
                    AnchorPoint = Vector2.new(0.5, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1, -- for now
                    BorderSizePixel = 0,
                    Position = (tab.page_type == 'single_section' and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0.25, 0, 0, 0)),
                    Size = (tab.page_type == 'single_section' and UDim2.new(1, 0, 0, 250) or UDim2.new(0.5, 0, 0, 250)),
                })

                helpers.new_instance('UIPadding', {
                    Parent = tab.containers[1],
                    PaddingTop = UDim.new(0, 6),
                    PaddingBottom = UDim.new(0, 6),
                    PaddingLeft = UDim.new(0, 6),
                    PaddingRight = UDim.new(0, (tab.page_type == 'single_section' and 6 or 3)),
                })

                helpers.new_instance('UIListLayout', {
                    Parent = tab.containers[1],
                    Padding = UDim.new(0, 6),
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                })

                if tab.page_type == 'multi_section' then
                    tab.containers[2] = helpers.new_instance('Frame', {
                        Parent = tab.page,
                        AnchorPoint = Vector2.new(0.5, 0),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1, -- for now
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.75, 0, 0, 0),
                        Size = UDim2.new(0.5, 0, 0, 250),
                    })

                    helpers.new_instance('UIPadding', {
                        Parent = tab.containers[2],
                        PaddingTop = UDim.new(0, 6),
                        PaddingBottom = UDim.new(0, 6),
                        PaddingLeft = UDim.new(0, 3),
                        PaddingRight = UDim.new(0, 6),
                    })

                    helpers.new_instance('UIListLayout', {
                        Parent = tab.containers[2],
                        Padding = UDim.new(0, 6),
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })
                end

                tab.new_subsection = function(subsection_settings)
                    subsection_settings = subsection_settings or {}

                    local subsection_defaults = {
                        title = 'Subsection',
                        container = "left", -- "left" or "right" for multi_section tabs, will be ignored for single_section tabs
                    }

                    local subsection = helpers.merge_settings(subsection_defaults, subsection_settings)
                    subsection.title = subsection.title or 'Subsection'
                    subsection.container = subsection.container or "left"


                    subsection.main = helpers.new_instance('Frame', {
                        Parent = (tab.page_type == 'single_section' and tab.containers[1] or (subsection.container == "left" and tab.containers[1] or tab.containers[2])),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = theme.subsectionBackground,
                        BackgroundTransparency = 0.75,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 128),
                    })

                    helpers.bind_theme(window, subsection.main, "BackgroundColor3", "subsectionBackground")

                    helpers.new_instance('UICorner', {
                        Parent = subsection.main,
                        CornerRadius = UDim.new(0, 4),
                    })

                    local subsection_stroke1 = helpers.new_instance('UIStroke', {
                        Parent = subsection.main,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        BorderStrokePosition = Enum.BorderStrokePosition.Center,
                        Color = theme.subsectionStroke,
                        Thickness = 1,
                        Transparency = 0.64,
                    })

                    helpers.bind_theme(window, subsection_stroke1, "Color", "subsectionStroke")

                    local subsection_stroke2 = helpers.new_instance('UIStroke', {
                        Parent = subsection.main,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                        Color = theme.subsectionStroke,
                        Thickness = 1,
                        Transparency = 0.64,
                    })

                    helpers.bind_theme(window, subsection_stroke2, "Color", "subsectionStroke")

                    subsection.title = helpers.new_instance('TextLabel', {
                        Parent = subsection.main,
                        AnchorPoint = Vector2.new(0.5, 0),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.5, 0, 0, 0),
                        Size = UDim2.new(1, 0, 0, 32),
                        FontFace = Font.new(
                            'rbxassetid://12187365364',
                            Enum.FontWeight.Medium,
                            Enum.FontStyle.Normal
                        ),
                        Text = subsection.title,
                        TextColor3 = theme.subsectionTitleText,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                    })

                    helpers.bind_theme(window, subsection.title, "TextColor3", "subsectionTitleText")

                    helpers.new_instance('UIPadding', {
                        Parent = subsection.title,
                        PaddingLeft = UDim.new(0, 16),
                    })

                    local subsection_title_stroke = helpers.new_instance('UIStroke', {
                        Parent = subsection.title,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                        Color = theme.subsectionTitleStroke,
                        Thickness = 2,
                        Transparency = 0.864,
                    })

                    helpers.bind_theme(window, subsection_title_stroke, "Color", "subsectionTitleStroke")

                    local subsection_title_gradient = helpers.new_instance('UIGradient', {
                        Parent = subsection.title,
                        Color = helpers.toColorSequence(theme.subsectionTitleGradient),
                        Rotation = 90,
                    })

                    helpers.bind_theme(window, subsection_title_gradient, "Color", "subsectionTitleGradient", {
                        convert = helpers.toColorSequence,
                    })

                    subsection.content = helpers.new_instance('Frame', {
                        Parent = subsection.main,
                        AnchorPoint = Vector2.new(0.5, 0),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0.5, 0, 0, 32),
                        Size = UDim2.new(1, 0, 0, 100),
                    })

                    helpers.new_instance('UIListLayout', {
                        Parent = subsection.content,
                        Padding = UDim.new(0, 6),
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })

                    helpers.new_instance('UIPadding', {
                        Parent = subsection.content,
                        PaddingBottom = UDim.new(0, 8),
                        PaddingLeft = UDim.new(0, 6),
                        PaddingRight = UDim.new(0, 6),
                    })

                    subsection.textbutton = function(textbutton_settings)
                        textbutton_settings = textbutton_settings or {}

                        local textbutton_defaults = {
                            title = 'button',
                            callback = function() end,
                        }

                        local textbutton = helpers.merge_settings(textbutton_defaults, textbutton_settings)
                        textbutton.title = textbutton.title or 'button'
                        if typeof(textbutton.callback) ~= "function" then
                            textbutton.callback = function() end
                        end

                        textbutton.host_frame = helpers.new_instance('Frame', {
                            Parent = subsection.content,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.new(1, 0, 0, 0),
                        })

                        textbutton.button = helpers.new_instance('TextButton', {
                            Parent = textbutton.host_frame,
                            AnchorPoint = Vector2.new(0.5, 0),
                            AutoButtonColor = false,
                            BackgroundColor3 = theme.textButtonBackgroundInactive,
                            BackgroundTransparency = 0.75,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0.5, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 32),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            Text = textbutton.title,
                            TextColor3 = theme.textButtonTextColor,
                            TextSize = 12,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Center,
                        })

                        helpers.bind_theme(window, textbutton.button, "TextColor3", "textButtonTextColor")

                        textbutton.button_padding = helpers.new_instance('UIPadding', {
                            Parent = textbutton.button,
                            PaddingLeft = UDim.new(0, 12),
                            PaddingRight = UDim.new(0, 12),
                        })

                        helpers.new_instance('UICorner', {
                            Parent = textbutton.button,
                            CornerRadius = UDim.new(0, 4),
                        })

                        local text_button_gradient = helpers.new_instance('UIGradient', {
                            Parent = textbutton.button,
                            Color = helpers.toColorSequence(theme.textButtonGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, text_button_gradient, "Color", "textButtonGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local text_button_stroke1 = helpers.new_instance('UIStroke', {
                            Parent = textbutton.button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Center,
                            Color = theme.textButtonStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, text_button_stroke1, "Color", "textButtonStroke")

                        local text_button_stroke2 = helpers.new_instance('UIStroke', {
                            Parent = textbutton.button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                            Color = theme.textButtonStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, text_button_stroke2, "Color", "textButtonStroke")

                        local text_button_highlight = helpers.new_instance('UIStroke', {
                            Parent = textbutton.button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.textButtonHighlightStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, text_button_highlight, "Color", "textButtonHighlightStroke")

                        textbutton.isHovering = false
                        textbutton.state = "inactive"

                        local backgroundKeys = {
                            inactive = "textButtonBackgroundInactive",
                            hover = "textButtonBackgroundHover",
                            active = "textButtonBackgroundActive",
                            press = "textButtonBackgroundPress",
                        }

                        local fontWeights = {
                            inactive = Enum.FontWeight.Medium,
                            hover = Enum.FontWeight.SemiBold,
                            active = Enum.FontWeight.Bold,
                            press = Enum.FontWeight.Bold,
                        }

                        local horizontalPadding = {
                            inactive = 12,
                            hover = 14,
                            active = 16,
                            press = 14,
                        }

                        function textbutton:_apply_style(state, instant)
                            self.state = state
                            local themeSnapshot = window.interface.theme
                            local backgroundKey = backgroundKeys[state] or backgroundKeys.inactive
                            local fontWeight = fontWeights[state] or fontWeights.inactive
                            local paddingValue = horizontalPadding[state] or horizontalPadding.inactive
                            local targetBackground = themeSnapshot[backgroundKey]
                                or themeSnapshot[backgroundKeys.inactive]
                                or self.button.BackgroundColor3
                            local targetPadding = UDim.new(0, paddingValue)
                            local targetPaddingTop = UDim.new(0, state == "press" and 2 or 0)

                            local function cancel_tween(field)
                                if self[field] then
                                    self[field]:Cancel()
                                    self[field] = nil
                                end
                            end

                            if instant then
                                cancel_tween('_styleTweenBackground')
                                cancel_tween('_styleTweenPaddingLeft')
                                cancel_tween('_styleTweenPaddingRight')
                                cancel_tween('_styleTweenPaddingTop')

                                self.button.BackgroundColor3 = targetBackground
                                self.button_padding.PaddingLeft = targetPadding
                                self.button_padding.PaddingRight = targetPadding
                                self.button_padding.PaddingTop = targetPaddingTop
                            else
                                local function tween_property(field, instance, property, value)
                                    cancel_tween(field)
                                    local tween = helpers.tween_object(
                                        instance,
                                        {
                                            [property] = value,
                                        },
                                        0.32,
                                        Enum.EasingStyle.Quart,
                                        Enum.EasingDirection.Out
                                    )
                                    self[field] = tween
                                    tween.Completed:Connect(function(_, playbackState)
                                        if playbackState ~= Enum.PlaybackState.Cancelled and self[field] == tween then
                                            self[field] = nil
                                        elseif playbackState == Enum.PlaybackState.Cancelled and self[field] == tween then
                                            self[field] = nil
                                        end
                                    end)
                                end

                                tween_property('_styleTweenBackground', self.button, 'BackgroundColor3', targetBackground)
                                tween_property('_styleTweenPaddingLeft', self.button_padding, 'PaddingLeft', targetPadding)
                                tween_property('_styleTweenPaddingRight', self.button_padding, 'PaddingRight', targetPadding)
                                tween_property('_styleTweenPaddingTop', self.button_padding, 'PaddingTop', targetPaddingTop)
                            end

                            self.button.FontFace = Font.new(
                                'rbxassetid://12187365364',
                                fontWeight,
                                Enum.FontStyle.Normal
                            )
                        end

                        textbutton:_apply_style("inactive", true)

                        local function apply_hover_state()
                            if textbutton.isHovering then
                                textbutton:_apply_style("hover")
                            else
                                textbutton:_apply_style("inactive")
                            end
                        end

                        textbutton.button.MouseEnter:Connect(function()
                            textbutton.isHovering = true
                            textbutton:_apply_style("hover")
                        end)

                        textbutton.button.MouseLeave:Connect(function()
                            textbutton.isHovering = false
                            textbutton:_apply_style("inactive")
                        end)

                        textbutton.button.MouseButton1Down:Connect(function()
                            textbutton:_apply_style("press")
                        end)

                        textbutton.button.MouseButton1Up:Connect(function()
                            apply_hover_state()
                        end)

                        textbutton.button.MouseButton1Click:Connect(function()
                            task.spawn(function()
                                local ok, err = pcall(textbutton.callback)
                                if not ok then
                                    warn(string.format("textbutton callback error for '%s': %s", textbutton.title, err))
                                end
                            end)
                        end)

                        window:_register_theme_dependent(function()
                            textbutton:_apply_style(textbutton.state or "inactive", true)
                        end)

                        return textbutton
                    end

                    subsection.textbox = function(textbox_settings)
                        textbox_settings = textbox_settings or {}

                        local textbox_defaults = {
                            title = 'textbox',
                            default = '',
                            placeholder = '',
                            clear_on_focus = false,
                            multiline = false,
                            max_length = nil,
                            callback = function() end,
                        }

                        local textbox = helpers.merge_settings(textbox_defaults, textbox_settings)
                        textbox.title = textbox.title or 'textbox'
                        if typeof(textbox.callback) ~= "function" then
                            textbox.callback = textbox_defaults.callback
                        end

                        textbox.host_frame = helpers.new_instance('Frame', {
                            Parent = subsection.content,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.new(1, 0, 0, 0),
                        })

                        textbox.max_length = tonumber(textbox.max_length)
                        if textbox.max_length and textbox.max_length <= 0 then
                            textbox.max_length = nil
                        end

                        local baseFontStyle = Enum.FontStyle.Normal

                        textbox.entry = helpers.new_instance('TextBox', {
                            Parent = textbox.host_frame,
                            AnchorPoint = Vector2.new(0.5, 0),
                            BackgroundColor3 = theme.textButtonBackgroundInactive,
                            BackgroundTransparency = 0.75,
                            BorderSizePixel = 0,
                            ClearTextOnFocus = textbox.clear_on_focus == true,
                            CursorPosition = -1,
                            MultiLine = textbox.multiline == true,
                            Position = UDim2.new(0.5, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, textbox.multiline and 48 or 32),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            PlaceholderText = textbox.placeholder or '',
                            Text = textbox.default or '',
                            TextEditable = true,
                            TextColor3 = theme.textButtonTextColor,
                            TextSize = 12,
                            TextWrapped = textbox.multiline == true,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = (textbox.multiline == true) and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
                        })

                        if textbox.max_length then
                            textbox.entry.MaxVisibleGraphemes = math.floor(textbox.max_length)
                        end

                        helpers.bind_theme(window, textbox.entry, "TextColor3", "textButtonTextColor")

                        textbox.entry_padding = helpers.new_instance('UIPadding', {
                            Parent = textbox.entry,
                            PaddingLeft = UDim.new(0, 12),
                            PaddingRight = UDim.new(0, 12),
                        })

                        helpers.new_instance('UICorner', {
                            Parent = textbox.entry,
                            CornerRadius = UDim.new(0, 4),
                        })

                        local text_box_gradient = helpers.new_instance('UIGradient', {
                            Parent = textbox.entry,
                            Color = helpers.toColorSequence(theme.textButtonGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, text_box_gradient, "Color", "textButtonGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local text_box_stroke1 = helpers.new_instance('UIStroke', {
                            Parent = textbox.entry,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Center,
                            Color = theme.textButtonStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, text_box_stroke1, "Color", "textButtonStroke")

                        local text_box_stroke2 = helpers.new_instance('UIStroke', {
                            Parent = textbox.entry,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                            Color = theme.textButtonStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, text_box_stroke2, "Color", "textButtonStroke")

                        local text_box_highlight = helpers.new_instance('UIStroke', {
                            Parent = textbox.entry,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.textButtonHighlightStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, text_box_highlight, "Color", "textButtonHighlightStroke")

                        textbox.state = "inactive"
                        textbox.isHovering = false
                        textbox.isFocused = false

                        local backgroundKeys = {
                            inactive = "textButtonBackgroundInactive",
                            hover = "textButtonBackgroundHover",
                            active = "textButtonBackgroundActive",
                            press = "textButtonBackgroundPress",
                            focus = "textButtonBackgroundActive",
                        }

                        local fontWeights = {
                            inactive = Enum.FontWeight.Medium,
                            hover = Enum.FontWeight.SemiBold,
                            active = Enum.FontWeight.Bold,
                            press = Enum.FontWeight.Bold,
                            focus = Enum.FontWeight.Bold,
                        }

                        local horizontalPadding = {
                            inactive = 12,
                            hover = 14,
                            active = 16,
                            press = 14,
                            focus = 16,
                        }

                        local function cancel_tween(field)
                            if textbox[field] then
                                textbox[field]:Cancel()
                                textbox[field] = nil
                            end
                        end

                        local function tween_property(field, instance, property, value, duration)
                            cancel_tween(field)
                            local tween = helpers.tween_object(
                                instance,
                                {
                                    [property] = value,
                                },
                                duration or 0.32,
                                Enum.EasingStyle.Quart,
                                Enum.EasingDirection.Out
                            )
                            textbox[field] = tween
                            tween.Completed:Connect(function(_, playbackState)
                                if playbackState ~= Enum.PlaybackState.Cancelled and textbox[field] == tween then
                                    textbox[field] = nil
                                elseif playbackState == Enum.PlaybackState.Cancelled and textbox[field] == tween then
                                    textbox[field] = nil
                                end
                            end)
                        end

                        function textbox:_apply_style(state, instant)
                            self.state = state
                            local stateKey = backgroundKeys[state] and state or (self.isFocused and 'focus' or 'inactive')
                            local themeSnapshot = window.interface.theme
                            local backgroundKey = backgroundKeys[stateKey] or backgroundKeys.inactive
                            local fontWeight = fontWeights[stateKey] or fontWeights.inactive
                            local paddingValue = horizontalPadding[stateKey] or horizontalPadding.inactive
                            local targetBackground = themeSnapshot[backgroundKey]
                                or themeSnapshot[backgroundKeys.inactive]
                                or self.entry.BackgroundColor3
                            local targetPadding = UDim.new(0, paddingValue)
                            local targetPaddingTop = UDim.new(0, stateKey == "press" and 2 or 0)

                            if instant then
                                cancel_tween('_styleTweenBackground')
                                cancel_tween('_styleTweenPaddingLeft')
                                cancel_tween('_styleTweenPaddingRight')
                                cancel_tween('_styleTweenPaddingTop')

                                self.entry.BackgroundColor3 = targetBackground
                                self.entry_padding.PaddingLeft = targetPadding
                                self.entry_padding.PaddingRight = targetPadding
                                self.entry_padding.PaddingTop = targetPaddingTop
                            else
                                tween_property('_styleTweenBackground', self.entry, 'BackgroundColor3', targetBackground)
                                tween_property('_styleTweenPaddingLeft', self.entry_padding, 'PaddingLeft', targetPadding)
                                tween_property('_styleTweenPaddingRight', self.entry_padding, 'PaddingRight', targetPadding)
                                tween_property('_styleTweenPaddingTop', self.entry_padding, 'PaddingTop', targetPaddingTop, 0.18)
                            end

                            self.entry.FontFace = Font.new(
                                'rbxassetid://12187365364',
                                fontWeight,
                                baseFontStyle
                            )
                        end

                        textbox:_apply_style("inactive", true)

                        local function apply_hover_state()
                            if textbox.isFocused then
                                textbox:_apply_style("focus")
                            elseif textbox.isHovering then
                                textbox:_apply_style("hover")
                            else
                                textbox:_apply_style("inactive")
                            end
                        end

                        textbox.entry.MouseEnter:Connect(function()
                            textbox.isHovering = true
                            if not textbox.isFocused then
                                textbox:_apply_style("hover")
                            end
                        end)

                        textbox.entry.MouseLeave:Connect(function()
                            textbox.isHovering = false
                            if not textbox.isFocused then
                                textbox:_apply_style("inactive")
                            end
                        end)

                        textbox.entry.Focused:Connect(function()
                            textbox.isFocused = true
                            textbox:_apply_style("focus")
                        end)

                        textbox.entry.FocusLost:Connect(function(enterPressed)
                            textbox.isFocused = false
                            apply_hover_state()
                            task.spawn(function()
                                local ok, err = pcall(textbox.callback, textbox.entry.Text, enterPressed)
                                if not ok then
                                    warn(string.format("textbox callback error for '%s': %s", textbox.title, err))
                                end
                            end)
                        end)



                        function textbox:set(text)
                            text = tostring(text or '')
                            self.entry.Text = text
                        end

                        function textbox:get()
                            return self.entry.Text
                        end

                        function textbox:set_placeholder(text)
                            self.entry.PlaceholderText = tostring(text or '')
                        end

                        function textbox:clear()
                            self.entry.Text = ''
                        end

                        window:_register_theme_dependent(function()
                            textbox:_apply_style(textbox.state or "inactive", true)
                        end)

                        return textbox
                    end

                    subsection.checkbox = function(checkbox_settings)
                        checkbox_settings = checkbox_settings or {}

                        local checkbox_defaults = {
                            title = 'Checkbox',
                            subtext = '',
                            default = false,
                            callback = function() end,
                        }

                        local checkbox = helpers.merge_settings(checkbox_defaults, checkbox_settings)
                        checkbox.title = checkbox.title or 'Checkbox'
                        checkbox.subtext = checkbox.subtext or ''
                        checkbox.default = checkbox.default and true or false
                        if typeof(checkbox.callback) ~= "function" then
                            checkbox.callback = checkbox_defaults.callback
                        end

                        checkbox.enabled = checkbox.default
                        checkbox.state = "inactive"
                        checkbox.isHovering = false

                        checkbox.host_frame = helpers.new_instance('Frame', {
                            Parent = subsection.content,
                            AnchorPoint = Vector2.new(0.5, 0),
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0.5, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 32),
                        })

                        local checkbox_textblock = helpers.new_instance('Frame', {
                            Parent = checkbox.host_frame,
                            AnchorPoint = Vector2.new(0, 0),
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.new(1, -44, 0, 0),
                        })

                        helpers.new_instance('UIPadding', {
                            Parent = checkbox_textblock,
                            PaddingLeft = UDim.new(0, 6),
                            PaddingRight = UDim.new(0, 6),
                        })

                        local textblock_layout = helpers.new_instance('UIListLayout', {
                            Parent = checkbox_textblock,
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 2),
                        })

                        checkbox.title_label = helpers.new_instance('TextLabel', {
                            Parent = checkbox_textblock,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            LayoutOrder = 1,
                            Size = UDim2.new(1, 0, 0, 0),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            Text = checkbox.title,
                            TextColor3 = theme.checkboxTitleText,
                            TextSize = 14,
                            TextTruncate = Enum.TextTruncate.AtEnd,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextYAlignment = Enum.TextYAlignment.Center,
                        })

                        helpers.bind_theme(window, checkbox.title_label, "TextColor3", "checkboxTitleText")

                        local checkbox_title_gradient = helpers.new_instance('UIGradient', {
                            Parent = checkbox.title_label,
                            Color = helpers.toColorSequence(theme.checkboxTitleGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, checkbox_title_gradient, "Color", "checkboxTitleGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local checkbox_title_stroke = helpers.new_instance('UIStroke', {
                            Parent = checkbox.title_label,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.checkboxTitleStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, checkbox_title_stroke, "Color", "checkboxTitleStroke")

                        checkbox.subtext_label = helpers.new_instance('TextLabel', {
                            Parent = checkbox_textblock,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            LayoutOrder = 2,
                            Size = UDim2.new(1, 0, 0, 0),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Regular,
                                Enum.FontStyle.Normal
                            ),
                            Text = checkbox.subtext,
                            TextColor3 = theme.checkboxSubtextText,
                            TextSize = 12,
                            TextTruncate = Enum.TextTruncate.AtEnd,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextYAlignment = Enum.TextYAlignment.Center,
                        })

                        helpers.bind_theme(window, checkbox.subtext_label, "TextColor3", "checkboxSubtextText")

                        local checkbox_subtext_gradient = helpers.new_instance('UIGradient', {
                            Parent = checkbox.subtext_label,
                            Color = helpers.toColorSequence(theme.checkboxSubtextGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, checkbox_subtext_gradient, "Color", "checkboxSubtextGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local checkbox_subtext_stroke = helpers.new_instance('UIStroke', {
                            Parent = checkbox.subtext_label,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.checkboxSubtextStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, checkbox_subtext_stroke, "Color", "checkboxSubtextStroke")

                        checkbox.button = helpers.new_instance('ImageButton', {
                            Parent = checkbox.host_frame,
                            AnchorPoint = Vector2.new(1, 0.5),
                            AutoButtonColor = false,
                            BackgroundColor3 = theme.checkboxBackgroundInactive,
                            BackgroundTransparency = 0.75,
                            BorderSizePixel = 0,
                            Position = UDim2.new(1, 0, 0.5, 0),
                            Size = UDim2.new(0, 32, 0, 32),
                            Image = "rbxassetid://11604833061",
                            ImageColor3 = theme.checkboxIconColor,
                            ImageTransparency = (checkbox.enabled and 0 or 1),
                        })

                        helpers.bind_theme(window, checkbox.button, "ImageColor3", "checkboxIconColor")

                        helpers.new_instance('UICorner', {
                            Parent = checkbox.button,
                            CornerRadius = UDim.new(0, 4),
                        })

                        local checkbox_button_gradient = helpers.new_instance('UIGradient', {
                            Parent = checkbox.button,
                            Color = helpers.toColorSequence(theme.checkboxGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, checkbox_button_gradient, "Color", "checkboxGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local checkbox_button_stroke1 = helpers.new_instance('UIStroke', {
                            Parent = checkbox.button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Center,
                            Color = theme.checkboxStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, checkbox_button_stroke1, "Color", "checkboxStroke")

                        local checkbox_button_stroke2 = helpers.new_instance('UIStroke', {
                            Parent = checkbox.button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                            Color = theme.checkboxStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, checkbox_button_stroke2, "Color", "checkboxStroke")

                        local backgroundKeysDisabled = {
                            inactive = "checkboxBackgroundInactive",
                            hover = "checkboxBackgroundHover",
                            press = "checkboxBackgroundPress",
                        }

                        local backgroundKeysEnabled = {
                            inactive = "checkboxBackgroundActive",
                            hover = "checkboxBackgroundHover",
                            press = "checkboxBackgroundPress",
                        }

                        local function cancel_tween(field)
                            if checkbox[field] then
                                checkbox[field]:Cancel()
                                checkbox[field] = nil
                            end
                        end

                        local function tween_property(field, instance, property, value, duration)
                            cancel_tween(field)
                            local tween = helpers.tween_object(
                                instance,
                                {
                                    [property] = value,
                                },
                                duration or 0.32,
                                Enum.EasingStyle.Quart,
                                Enum.EasingDirection.Out
                            )
                            checkbox[field] = tween
                            tween.Completed:Connect(function(_, playbackState)
                                if playbackState ~= Enum.PlaybackState.Cancelled and checkbox[field] == tween then
                                    checkbox[field] = nil
                                elseif playbackState == Enum.PlaybackState.Cancelled and checkbox[field] == tween then
                                    checkbox[field] = nil
                                end
                            end)
                        end

                        function checkbox:_apply_style(state, instant)
                            self.state = state
                            local pointerState = state or "inactive"
                            local themeSnapshot = window.interface.theme
                            local backgroundMap = self.enabled and backgroundKeysEnabled or backgroundKeysDisabled
                            local backgroundKey = backgroundMap[pointerState] or backgroundMap.inactive
                            local targetBackground = themeSnapshot[backgroundKey]
                                or themeSnapshot[backgroundMap.inactive]
                                or self.button.BackgroundColor3
                            local targetIconTransparency = self.enabled and 0 or 1
                            local targetTitleWeight = self.enabled and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium

                            if instant then
                                cancel_tween('_styleTweenBackground')
                                cancel_tween('_styleTweenIcon')

                                self.button.BackgroundColor3 = targetBackground
                                self.button.ImageTransparency = targetIconTransparency
                            else
                                tween_property('_styleTweenBackground', self.button, 'BackgroundColor3', targetBackground)
                                tween_property('_styleTweenIcon', self.button, 'ImageTransparency', targetIconTransparency, 0.18)
                            end

                            self.title_label.FontFace = Font.new(
                                'rbxassetid://12187365364',
                                targetTitleWeight,
                                Enum.FontStyle.Normal
                            )
                        end

                        checkbox:_apply_style("inactive", true)

                        checkbox.button.MouseEnter:Connect(function()
                            checkbox.isHovering = true
                            checkbox:_apply_style("hover")
                        end)

                        checkbox.button.MouseLeave:Connect(function()
                            checkbox.isHovering = false
                            checkbox:_apply_style("inactive")
                        end)

                        checkbox.button.MouseButton1Down:Connect(function()
                            checkbox:_apply_style("press")
                        end)

                        checkbox.button.MouseButton1Up:Connect(function()
                            checkbox:_apply_style(checkbox.isHovering and "hover" or "inactive")
                        end)

                        checkbox.button.MouseButton1Click:Connect(function()
                            checkbox.enabled = not checkbox.enabled
                            checkbox:_apply_style(checkbox.isHovering and "hover" or "inactive")
                            task.spawn(function()
                                local ok, err = pcall(checkbox.callback, checkbox.enabled)
                                if not ok then
                                    warn(string.format("checkbox callback error for '%s': %s", checkbox.title, err))
                                end
                            end)
                        end)

                        window:_register_theme_dependent(function()
                            checkbox:_apply_style(checkbox.state or "inactive", true)
                            checkbox.title_label.Text = checkbox.title
                            checkbox.subtext_label.Text = checkbox.subtext
                        end)

                        return checkbox
                    end

                    subsection.slider = function(slider_settings)
                        slider_settings = slider_settings or {}

                        local slider_defaults = {
                            title = 'Slider',
                            min = 0,
                            max = 100,
                            step = 1,
                            step_count = nil,
                            default = 0,
                            range = nil,
                            canOverride = false,
                            callback = function() end,
                        }

                        local slider = helpers.merge_settings(slider_defaults, slider_settings)
                        slider.title = slider.title or 'Slider'
                        if typeof(slider.callback) ~= "function" then
                            slider.callback = slider_defaults.callback
                        end

                        local function to_number(value)
                            local numeric = tonumber(value)
                            return numeric
                        end

                        if typeof(slider.range) == "table" then
                            if slider.range[1] ~= nil then
                                slider.min = to_number(slider.range[1]) or slider.min
                            end
                            if slider.range[2] ~= nil then
                                slider.max = to_number(slider.range[2]) or slider.max
                            end
                        end

                        slider.min = to_number(slider.min) or 0
                        slider.max = to_number(slider.max) or (slider.min + 1)
                        if slider.min == slider.max then
                            slider.max = slider.min + 1
                        elseif slider.min > slider.max then
                            slider.min, slider.max = slider.max, slider.min
                        end

                        slider.range_size = slider.max - slider.min

                        local provided_step = to_number(slider.step)
                        local provided_step_count = to_number(slider.step_count)
                        if provided_step_count and provided_step_count > 0 then
                            provided_step = slider.range_size / provided_step_count
                        end
                        if not provided_step or provided_step <= 0 then
                            provided_step = 1
                        end
                        slider.step = provided_step
                        slider.step_count = provided_step_count

                        slider.can_override = slider.canOverride == true or slider.can_override == true

                        local function infer_decimal_places(value)
                            local str = tostring(value)
                            local decimals = string.match(str, '%.(%d+)')
                            if decimals then
                                return math.clamp(#decimals, 0, 6)
                            end
                            return 0
                        end

                        slider.decimal_places = slider.decimal_places or infer_decimal_places(slider.step)

                        slider.host_frame = helpers.new_instance('Frame', {
                            Parent = subsection.content,
                            AnchorPoint = Vector2.new(0.5, 0),
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0.5, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 0),
                        })

                        slider._connections = {}

                        local function track_slider_connection(connection)
                            if connection then
                                table.insert(slider._connections, connection)
                            end
                            return connection
                        end

                        local slider_layout = helpers.new_instance('UIListLayout', {
                            Parent = slider.host_frame,
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 0),
                        })

                        slider_layout.Name = "SliderLayout"

                        local label_row = helpers.new_instance('Frame', {
                            Parent = slider.host_frame,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            LayoutOrder = 1,
                            Size = UDim2.new(1, 0, 0, 32),
                        })

                        helpers.new_instance('UIPadding', {
                            Parent = label_row,
                            PaddingLeft = UDim.new(0, 6),
                            PaddingRight = UDim.new(0, 6),
                        })

                        slider.title_label = helpers.new_instance('TextLabel', {
                            Parent = label_row,
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0, 0, 0.5, 0),
                            Size = UDim2.new(1, -100, 0, 0),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            Text = slider.title,
                            TextColor3 = theme.sliderLabelText,
                            TextSize = 14,
                            TextTruncate = Enum.TextTruncate.AtEnd,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextYAlignment = Enum.TextYAlignment.Center,
                        })

                        helpers.bind_theme(window, slider.title_label, "TextColor3", "sliderLabelText")

                        local slider_title_gradient = helpers.new_instance('UIGradient', {
                            Parent = slider.title_label,
                            Color = helpers.toColorSequence(theme.sliderLabelGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, slider_title_gradient, "Color", "sliderLabelGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local slider_title_stroke = helpers.new_instance('UIStroke', {
                            Parent = slider.title_label,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.sliderLabelStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, slider_title_stroke, "Color", "sliderLabelStroke")

                        slider.value_input = helpers.new_instance('TextBox', {
                            Parent = label_row,
                            AnchorPoint = Vector2.new(1, 0.5),
                            BackgroundColor3 = theme.sliderInputBackground,
                            BackgroundTransparency = 0.75,
                            BorderSizePixel = 0,
                            ClearTextOnFocus = false,
                            CursorPosition = -1,
                            LayoutOrder = 2,
                            Position = UDim2.new(1, 6, 0.5, 0),
                            Size = UDim2.new(0, 64, 0, 32),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            Text = '',
                            TextColor3 = theme.sliderInputTextColor,
                            PlaceholderColor3 = theme.sliderInputPlaceholderColor,
                            TextSize = 14,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Center,
                        })

                        helpers.bind_theme(window, slider.value_input, "BackgroundColor3", "sliderInputBackground")
                        helpers.bind_theme(window, slider.value_input, "TextColor3", "sliderInputTextColor")
                        helpers.bind_theme(window, slider.value_input, "PlaceholderColor3", "sliderInputPlaceholderColor")

                        helpers.new_instance('UICorner', {
                            Parent = slider.value_input,
                            CornerRadius = UDim.new(0, 4),
                        })

                        local slider_input_gradient = helpers.new_instance('UIGradient', {
                            Parent = slider.value_input,
                            Color = helpers.toColorSequence(theme.sliderInputGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, slider_input_gradient, "Color", "sliderInputGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local slider_input_stroke1 = helpers.new_instance('UIStroke', {
                            Parent = slider.value_input,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Center,
                            Color = theme.sliderInputStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, slider_input_stroke1, "Color", "sliderInputStroke")

                        local slider_input_stroke2 = helpers.new_instance('UIStroke', {
                            Parent = slider.value_input,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.sliderInputHighlightStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, slider_input_stroke2, "Color", "sliderInputHighlightStroke")

                        local track_row = helpers.new_instance('Frame', {
                            Parent = slider.host_frame,
                            AnchorPoint = Vector2.new(0.5, 0),
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            LayoutOrder = 2,
                            Size = UDim2.new(1, 0, 0, 32),
                        })

                        helpers.new_instance('UIPadding', {
                            Parent = track_row,
                            PaddingLeft = UDim.new(0, 6),
                            PaddingRight = UDim.new(0, 6),
                        })

                        slider.track = helpers.new_instance('Frame', {
                            Parent = track_row,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = theme.sliderTrackBackground,
                            BackgroundTransparency = 0.4,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                            Size = UDim2.new(1, 0, 0, 12),
                        })

                        helpers.bind_theme(window, slider.track, "BackgroundColor3", "sliderTrackBackground")

                        helpers.new_instance('UICorner', {
                            Parent = slider.track,
                            CornerRadius = UDim.new(1, 0),
                        })

                        local slider_track_stroke = helpers.new_instance('UIStroke', {
                            Parent = slider.track,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Color = theme.sliderTrackStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, slider_track_stroke, "Color", "sliderTrackStroke")

                        slider.fill = helpers.new_instance('Frame', {
                            Parent = slider.track,
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundColor3 = theme.sliderTrackFill,
                            BackgroundTransparency = 0.75,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0, 0, 0.5, 0),
                            Size = UDim2.new(0, 0, 1, 0),
                        })

                        helpers.new_instance('UICorner', {
                            Parent = slider.fill,
                            CornerRadius = UDim.new(1, 0),
                        })

                        helpers.bind_theme(window, slider.fill, "BackgroundColor3", "sliderTrackFill")

                        slider.handle = helpers.new_instance('Frame', {
                            Parent = slider.track,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundColor3 = theme.sliderHandleColor,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0, 0, 0.5, 0),
                            Size = UDim2.new(0, 16, 0, 16),
                            ZIndex = 2,
                        })

                        helpers.bind_theme(window, slider.handle, "BackgroundColor3", "sliderHandleColor")

                        helpers.new_instance('UICorner', {
                            Parent = slider.handle,
                            CornerRadius = UDim.new(1, 0),
                        })

                        local slider_handle_stroke = helpers.new_instance('UIStroke', {
                            Parent = slider.handle,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Color = theme.sliderHandleStroke,
                            Thickness = 1,
                            Transparency = 0.36,
                        })

                        helpers.bind_theme(window, slider_handle_stroke, "Color", "sliderHandleStroke")

                        local function snap_value(value)
                            local range_step = slider.step
                            if range_step <= 0 then
                                return value
                            end
                            local relative = (value - slider.min) / range_step
                            local snapped_relative = relative >= 0 and math.floor(relative + 0.5) or math.ceil(relative - 0.5)
                            return slider.min + snapped_relative * range_step
                        end

                        local function format_value(value)
                            local decimals = slider.decimal_places or 0
                            local fmt = string.format('%%.%df', math.clamp(decimals, 0, 6))
                            local text = string.format(fmt, value)
                            if string.find(text, '.', 1, true) then
                                text = text:gsub('0+$', '')
                                text = text:gsub('%.$', '')
                            end
                            if text == '' or text == '-' then
                                return '0'
                            end
                            return text
                        end

                        function slider:_update_input_text()
                            local formatted = format_value(self.current_value or self.min)
                            if not self.value_input:IsFocused() then
                                self.value_input.Text = formatted
                            end
                            self.value_input.PlaceholderText = formatted
                        end

                        local function tween_property(field, instance, property, value)
                            if slider[field] then
                                slider[field]:Cancel()
                                slider[field] = nil
                            end
                            local tween = helpers.tween_object(
                                instance,
                                {
                                    [property] = value,
                                },
                                0.28,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                            slider[field] = tween
                            tween.Completed:Connect(function(_, playbackState)
                                if playbackState ~= Enum.PlaybackState.Cancelled and slider[field] == tween then
                                    slider[field] = nil
                                elseif playbackState == Enum.PlaybackState.Cancelled and slider[field] == tween then
                                    slider[field] = nil
                                end
                            end)
                        end

                        function slider:_update_visuals(instant)
                            local value = self.current_value or self.min
                            local alpha = self.range_size > 0 and ((value - self.min) / self.range_size) or 0
                            local clampedAlpha = math.clamp(alpha, 0, 1)
                            local targetFill = UDim2.new(clampedAlpha, 0, 1, 0)
                            local targetHandle = UDim2.new(clampedAlpha, 0, 0.5, 0)

                            if instant then
                                if slider.fillTween then
                                    slider.fillTween:Cancel()
                                    slider.fillTween = nil
                                end
                                if slider.handleTween then
                                    slider.handleTween:Cancel()
                                    slider.handleTween = nil
                                end
                                slider.fill.Size = targetFill
                                slider.handle.Position = targetHandle
                            else
                                tween_property('fillTween', slider.fill, 'Size', targetFill)
                                tween_property('handleTween', slider.handle, 'Position', targetHandle)
                            end

                            slider:_update_input_text()
                        end

                        local function fire_callback(value)
                            task.spawn(function()
                                local ok, err = pcall(slider.callback, value)
                                if not ok then
                                    warn(string.format("slider callback error for '%s': %s", slider.title, err))
                                end
                            end)
                        end

                        function slider:_apply_value(raw_value, options)
                            options = options or {}
                            local allowOverride = false
                            if options.forceOverride then
                                allowOverride = true
                            elseif options.allowOverride then
                                allowOverride = self.can_override
                            end

                            local snapped = snap_value(raw_value)
                            if not allowOverride then
                                snapped = math.clamp(snapped, self.min, self.max)
                            end

                            if self.current_value ~= nil then
                                if math.abs(snapped - self.current_value) <= (self.step / 1000) then
                                    self.current_value = snapped
                                    self:_update_visuals(options.instant)
                                    return
                                end
                            end

                            self.current_value = snapped
                            self:_update_visuals(options.instant)

                            if not options.silent then
                                fire_callback(snapped)
                            end
                        end

                        function slider:set(value, opts)
                            self:_apply_value(value, {
                                forceOverride = true,
                                instant = opts and opts.instant or false,
                                silent = opts and opts.silent or false,
                            })
                        end

                        function slider:get()
                            return self.current_value
                        end

                        local current_default = to_number(slider.default)
                        if current_default == nil then
                            current_default = slider.min
                        end
                        slider.current_value = nil
                        slider:_apply_value(current_default, {
                            allowOverride = true,
                            instant = true,
                            silent = true,
                        })

                        local dragging = false
                        local dragInput
                        local dragInputChanged
                        local dragMoveConnection

                        local function end_drag()
                            dragging = false
                            if dragInputChanged then
                                dragInputChanged:Disconnect()
                                dragInputChanged = nil
                            end
                            if dragMoveConnection then
                                dragMoveConnection:Disconnect()
                                dragMoveConnection = nil
                            end
                            dragInput = nil
                        end

                        local function update_from_position(position)
                            local trackAbsoluteSize = slider.track.AbsoluteSize
                            local trackAbsolutePos = slider.track.AbsolutePosition
                            if trackAbsoluteSize.X <= 0 then
                                return
                            end
                            local relative = math.clamp((position - trackAbsolutePos.X) / trackAbsoluteSize.X, 0, 1)
                            local value = slider.min + relative * slider.range_size
                            slider:_apply_value(value, {
                                allowOverride = false,
                            })
                        end

                        local function begin_drag(input)
                            dragging = true
                            dragInput = input
                            update_from_position(input.Position.X)

                            dragInputChanged = track_slider_connection(input.Changed:Connect(function()
                                if input.UserInputState == Enum.UserInputState.End then
                                    end_drag()
                                end
                            end))

                            dragMoveConnection = track_slider_connection(UserInputService.InputChanged:Connect(function(moveInput)
                                if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
                                    if dragging then
                                        update_from_position(moveInput.Position.X)
                                    end
                                end
                            end))
                        end

                        local function handle_input_began(instance)
                            track_slider_connection(instance.InputBegan:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                    begin_drag(input)
                                end
                            end))

                            track_slider_connection(instance.InputEnded:Connect(function(input)
                                if input == dragInput then
                                    end_drag()
                                end
                            end))
                        end

                        handle_input_began(slider.track)
                        handle_input_began(slider.handle)

                        local function cleanup_slider_connections()
                            if slider._connections_cleaned then
                                return
                            end
                            slider._connections_cleaned = true
                            end_drag()
                            for _, connection in ipairs(slider._connections) do
                                connection:Disconnect()
                            end
                            table.clear(slider._connections)
                        end

                        slider.destroy = cleanup_slider_connections

                        track_slider_connection(slider.host_frame.AncestryChanged:Connect(function(_, parent)
                            if not parent then
                                cleanup_slider_connections()
                            end
                        end))

                        track_slider_connection(slider.value_input.FocusLost:Connect(function(enterPressed)
                            local text = slider.value_input.Text
                            if text == nil or text == '' then
                                slider:_update_input_text()
                                return
                            end
                            local numeric = tonumber(text)
                            if numeric == nil then
                                slider:_update_input_text()
                                return
                            end
                            slider:_apply_value(numeric, {
                                allowOverride = slider.can_override,
                            })
                        end))

                        track_slider_connection(slider.value_input.Focused:Connect(function()
                            slider.value_input.Text = format_value(slider.current_value)
                            slider.value_input.CursorPosition = #slider.value_input.Text + 1
                        end))

                        window:_register_theme_dependent(function()
                            slider.title_label.Text = slider.title
                            slider:_update_visuals(true)
                        end)

                        return slider
                    end

                    subsection.textlabel = function(textlabel_settings)
                        textlabel_settings = textlabel_settings or {}

                        local textlabel_defaults = {
                            text = 'Label',
                            alignment = Enum.TextXAlignment.Left,
                        }

                        local textlabel = helpers.merge_settings(textlabel_defaults, textlabel_settings)
                        textlabel.text = textlabel.text or textlabel_defaults.text
                        textlabel.alignment = textlabel.alignment or textlabel_defaults.alignment

                        textlabel.host_frame = helpers.new_instance('Frame', {
                            Parent = subsection.content,
                            AnchorPoint = Vector2.new(0.5, 0),
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0.5, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 0),
                        })

                        helpers.new_instance('UIPadding', {
                            Parent = textlabel.host_frame,
                            PaddingLeft = UDim.new(0, 6),
                            PaddingRight = UDim.new(0, 6),
                        })

                        textlabel.label = helpers.new_instance('TextLabel', {
                            Parent = textlabel.host_frame,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.new(1, 0, 0, 0),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            Text = textlabel.text,
                            TextColor3 = theme.textLabelTextColor,
                            TextSize = 13,
                            TextWrapped = true,
                            TextXAlignment = textlabel.alignment,
                            TextYAlignment = Enum.TextYAlignment.Center,
                        })

                        helpers.bind_theme(window, textlabel.label, "TextColor3", "textLabelTextColor")

                        local textlabel_gradient = helpers.new_instance('UIGradient', {
                            Parent = textlabel.label,
                            Color = helpers.toColorSequence(theme.textLabelGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, textlabel_gradient, "Color", "textLabelGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local textlabel_stroke = helpers.new_instance('UIStroke', {
                            Parent = textlabel.label,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.textLabelStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, textlabel_stroke, "Color", "textLabelStroke")

                        function textlabel:set(value)
                            local newValue
                            if value == nil then
                                newValue = ''
                            else
                                newValue = tostring(value)
                            end
                            self.text = newValue
                            self.label.Text = self.text
                        end

                        function textlabel:get()
                            return self.text
                        end

                        window:_register_theme_dependent(function()
                            textlabel.label.Text = textlabel.text
                            textlabel.label.TextXAlignment = textlabel.alignment
                        end)

                        return textlabel
                    end

                    subsection.dropdown = function(dropdown_settings)
                        dropdown_settings = dropdown_settings or {}

                        local dropdown_defaults = {
                            title = 'Dropdown',
                            options = {},
                            multi_select = false,
                            default = nil,
                            callback = function() end,
                        }

                        local dropdown = helpers.merge_settings(dropdown_defaults, dropdown_settings)
                        dropdown.title = dropdown.title or 'Dropdown'
                        dropdown.options = typeof(dropdown.options) == "table" and dropdown.options or {}
                        dropdown.multi_select = dropdown.multi_select and true or false
                        if typeof(dropdown.callback) ~= "function" then
                            dropdown.callback = dropdown_defaults.callback
                        end

                        local OPTION_HEIGHT = 28
                        local OPTION_PADDING = 6
                        local MAX_VISIBLE_OPTIONS = 5

                        dropdown.is_open = false
                        dropdown.option_buttons = {}
                        dropdown.button_state = "inactive"
                        dropdown.main_hovering = false
                        dropdown._selection_order = {}
                        dropdown._selection_map = {}
                        dropdown.selected_value = nil

                        local function normalize_option(option)
                            if typeof(option) == "string" then
                                return option
                            end
                            if typeof(option) == "table" and option.label then
                                return option.label
                            end
                            return tostring(option)
                        end

                        local normalized_options = {}
                        for _, option in ipairs(dropdown.options) do
                            normalized_options[#normalized_options + 1] = normalize_option(option)
                        end
                        dropdown.options = normalized_options

                        local normalized_defaults = {}
                        if dropdown.multi_select then
                            if typeof(dropdown.default) == "table" then
                                for _, value in ipairs(dropdown.default) do
                                    normalized_defaults[#normalized_defaults + 1] = normalize_option(value)
                                end
                            elseif dropdown.default ~= nil then
                                normalized_defaults[1] = normalize_option(dropdown.default)
                            end
                        elseif dropdown.default ~= nil then
                            normalized_defaults[1] = normalize_option(dropdown.default)
                        end

                        dropdown.host_frame = helpers.new_instance('Frame', {
                            Parent = subsection.content,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.new(1, 0, 0, 0),
                            ClipsDescendants = true,
                            AutomaticSize = Enum.AutomaticSize.Y,
                        })

                        dropdown._connections = {}

                        local function track_dropdown_connection(connection)
                            if connection then
                                table.insert(dropdown._connections, connection)
                            end
                            return connection
                        end

                        dropdown.main_button = helpers.new_instance('TextButton', {
                            Parent = dropdown.host_frame,
                            AnchorPoint = Vector2.new(0.5, 0),
                            AutoButtonColor = false,
                            BackgroundColor3 = theme.dropdownButtonBackgroundInactive,
                            BackgroundTransparency = 0.75,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0.5, 0, 0, 0),
                            Size = UDim2.new(1, 0, 0, 32),
                            FontFace = Font.new(
                                'rbxassetid://12187365364',
                                Enum.FontWeight.Medium,
                                Enum.FontStyle.Normal
                            ),
                            Text = dropdown.title,
                            TextColor3 = theme.dropdownButtonTextColor,
                            TextSize = 12,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Center,
                        })

                        helpers.bind_theme(window, dropdown.main_button, "TextColor3", "dropdownButtonTextColor")

                        helpers.new_instance('UICorner', {
                            Parent = dropdown.main_button,
                            CornerRadius = UDim.new(0, 4),
                        })

                        local dropdown_button_gradient = helpers.new_instance('UIGradient', {
                            Parent = dropdown.main_button,
                            Color = helpers.toColorSequence(theme.dropdownButtonGradient),
                            Rotation = 90,
                        })

                        helpers.bind_theme(window, dropdown_button_gradient, "Color", "dropdownButtonGradient", {
                            convert = helpers.toColorSequence,
                        })

                        local dropdown_button_stroke1 = helpers.new_instance('UIStroke', {
                            Parent = dropdown.main_button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Center,
                            Color = theme.dropdownButtonStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, dropdown_button_stroke1, "Color", "dropdownButtonStroke")

                        local dropdown_button_stroke2 = helpers.new_instance('UIStroke', {
                            Parent = dropdown.main_button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                            Color = theme.dropdownButtonStroke,
                            Thickness = 1,
                            Transparency = 0.64,
                        })

                        helpers.bind_theme(window, dropdown_button_stroke2, "Color", "dropdownButtonStroke")

                        local dropdown_button_highlight = helpers.new_instance('UIStroke', {
                            Parent = dropdown.main_button,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                            Color = theme.dropdownButtonHighlightStroke,
                            Thickness = 2,
                            Transparency = 0.864,
                        })

                        helpers.bind_theme(window, dropdown_button_highlight, "Color", "dropdownButtonHighlightStroke")

                        dropdown.items_frame = helpers.new_instance('ScrollingFrame', {
                            Parent = dropdown.host_frame,
                            AnchorPoint = Vector2.new(0.5, 0),
                            BackgroundColor3 = Color3.fromRGB(255,255,255),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Position = UDim2.new(0.5, 0, 0, 36),
                            Size = UDim2.new(1, 0, 0, 0),
                            ClipsDescendants = true,
                            ScrollBarImageTransparency = 1,
                            ScrollingDirection = Enum.ScrollingDirection.Y,
                            AutomaticCanvasSize = Enum.AutomaticSize.Y,
                            CanvasSize = UDim2.new(0, 0, 0, 0),
                            ScrollBarThickness = 0,
                        })

                        local list_layout = helpers.new_instance('UIListLayout', {
                            Parent = dropdown.items_frame,
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, OPTION_PADDING),
                        })

                        local function get_open_height(count)
                            if count <= 0 then
                                return 0
                            end
                            local visible = math.clamp(count, 1, MAX_VISIBLE_OPTIONS)
                            local paddingTotal = (visible - 1) * OPTION_PADDING
                            return visible * OPTION_HEIGHT + paddingTotal
                        end

                        local main_background_keys = {
                            inactive = "dropdownButtonBackgroundInactive",
                            hover = "dropdownButtonBackgroundHover",
                            active = "dropdownButtonBackgroundActive",
                            press = "dropdownButtonBackgroundPress",
                        }

                        local main_font_weights = {
                            inactive = Enum.FontWeight.Medium,
                            hover = Enum.FontWeight.SemiBold,
                            active = Enum.FontWeight.Bold,
                            press = Enum.FontWeight.Bold,
                        }

                        function dropdown:_apply_main_style(state, instant)
                            self.button_state = state
                            local themeSnapshot = window.interface.theme
                            local backgroundKey = main_background_keys[state] or main_background_keys.inactive
                            local fallbackKey = main_background_keys.inactive
                            local targetBackground = themeSnapshot[backgroundKey]
                                or themeSnapshot[fallbackKey]
                                or self.main_button.BackgroundColor3
                            local fontWeight = main_font_weights[state] or main_font_weights.inactive

                            local function cancel_tween(field)
                                if self[field] then
                                    self[field]:Cancel()
                                    self[field] = nil
                                end
                            end

                            if instant then
                                cancel_tween('_mainBackgroundTween')
                                self.main_button.BackgroundColor3 = targetBackground
                            else
                                cancel_tween('_mainBackgroundTween')
                                local tween = helpers.tween_object(
                                    self.main_button,
                                    {
                                        BackgroundColor3 = targetBackground,
                                    },
                                    0.32,
                                    Enum.EasingStyle.Quart,
                                    Enum.EasingDirection.Out
                                )
                                self._mainBackgroundTween = tween
                                tween.Completed:Connect(function(_, playbackState)
                                    if playbackState ~= Enum.PlaybackState.Cancelled and self._mainBackgroundTween == tween then
                                        self._mainBackgroundTween = nil
                                    elseif playbackState == Enum.PlaybackState.Cancelled and self._mainBackgroundTween == tween then
                                        self._mainBackgroundTween = nil
                                    end
                                end)
                            end

                            self.main_button.FontFace = Font.new(
                                'rbxassetid://12187365364',
                                fontWeight,
                                Enum.FontStyle.Normal
                            )
                        end

                        function dropdown:_refresh_main_state(instant)
                            if self.is_open then
                                self:_apply_main_style("active", instant)
                            elseif self.main_hovering then
                                self:_apply_main_style("hover", instant)
                            else
                                self:_apply_main_style("inactive", instant)
                            end
                        end

                        local function update_main_text()
                            if dropdown.multi_select then
                                local total = #dropdown._selection_order
                                if total == 0 then
                                    dropdown.main_button.Text = dropdown.title
                                elseif total == 1 then
                                    dropdown.main_button.Text = string.format("%s: %s", dropdown.title, dropdown._selection_order[1])
                                else
                                    dropdown.main_button.Text = string.format("%s (%d)", dropdown.title, total)
                                end
                            else
                                if dropdown.selected_value then
                                    dropdown.main_button.Text = string.format("%s: %s", dropdown.title, dropdown.selected_value)
                                else
                                    dropdown.main_button.Text = dropdown.title
                                end
                            end
                        end

                        local function fire_callback()
                            task.spawn(function()
                                local payload
                                if dropdown.multi_select then
                                    payload = table.clone(dropdown._selection_order)
                                else
                                    payload = dropdown.selected_value
                                end
                                local ok, err = pcall(dropdown.callback, payload)
                                if not ok then
                                    warn(string.format("dropdown callback error for '%s': %s", dropdown.title, err))
                                end
                            end)
                        end

                        local option_background_keys = {
                            default = {
                                inactive = "dropdownOptionBackground",
                                hover = "dropdownOptionBackgroundHover",
                            },
                            selected = {
                                inactive = "dropdownOptionBackgroundSelected",
                                hover = "dropdownOptionBackgroundSelectedHover",
                            },
                        }

                        function dropdown:_is_option_selected(label)
                            if self.multi_select then
                                return self._selection_map[label] == true
                            end
                            return self.selected_value == label
                        end

                        local function apply_option_style(entry, selected, instant)
                            local hoverState = entry.isHovering and "hover" or "inactive"
                            local collection = selected and option_background_keys.selected or option_background_keys.default
                            local backgroundKey = collection[hoverState] or collection.inactive
                            local themeSnapshot = window.interface.theme
                            local targetBackground = themeSnapshot[backgroundKey]
                                or themeSnapshot[collection.inactive]
                                or entry.button.BackgroundColor3
                            local targetTransparency = selected and 0.38 or 0.75
                            local targetTextTransparency = selected and 0 or 0.12
                            local targetWeight = selected and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium

                            local function cancel(field)
                                if entry[field] then
                                    entry[field]:Cancel()
                                    entry[field] = nil
                                end
                            end

                            if instant then
                                cancel('_backgroundTween')
                                cancel('_textTween')
                                entry.button.BackgroundColor3 = targetBackground
                                entry.button.BackgroundTransparency = targetTransparency
                                entry.button.TextTransparency = targetTextTransparency
                            else
                                cancel('_backgroundTween')
                                local backgroundTween = helpers.tween_object(
                                    entry.button,
                                    {
                                        BackgroundColor3 = targetBackground,
                                        BackgroundTransparency = targetTransparency,
                                    },
                                    0.28,
                                    Enum.EasingStyle.Quad,
                                    Enum.EasingDirection.Out
                                )
                                entry._backgroundTween = backgroundTween
                                backgroundTween.Completed:Connect(function(_, playbackState)
                                    if playbackState ~= Enum.PlaybackState.Cancelled and entry._backgroundTween == backgroundTween then
                                        entry._backgroundTween = nil
                                    elseif playbackState == Enum.PlaybackState.Cancelled and entry._backgroundTween == backgroundTween then
                                        entry._backgroundTween = nil
                                    end
                                end)

                                cancel('_textTween')
                                local textTween = helpers.tween_object(
                                    entry.button,
                                    {
                                        TextTransparency = targetTextTransparency,
                                    },
                                    0.18,
                                    Enum.EasingStyle.Quad,
                                    Enum.EasingDirection.Out
                                )
                                entry._textTween = textTween
                                textTween.Completed:Connect(function(_, playbackState)
                                    if playbackState ~= Enum.PlaybackState.Cancelled and entry._textTween == textTween then
                                        entry._textTween = nil
                                    elseif playbackState == Enum.PlaybackState.Cancelled and entry._textTween == textTween then
                                        entry._textTween = nil
                                    end
                                end)
                            end

                            entry.button.FontFace = Font.new(
                                'rbxassetid://12187365364',
                                targetWeight,
                                Enum.FontStyle.Normal
                            )
                        end

                        function dropdown:_apply_option_styles(instant)
                            for label, entry in pairs(self.option_buttons) do
                                apply_option_style(entry, self:_is_option_selected(label), instant)
                            end
                        end

                        local function set_open(state)
                            dropdown.is_open = state
                            local targetHeight = state and get_open_height(#dropdown.options) or 0
                            helpers.tween_object(
                                dropdown.items_frame,
                                {
                                    Size = UDim2.new(1, 0, 0, targetHeight),
                                },
                                0.64,
                                Enum.EasingStyle.Quart,
                                state and Enum.EasingDirection.Out or Enum.EasingDirection.InOut
                            )

                            dropdown:_refresh_main_state()
                        end

                        local function select_option(option)
                            if dropdown.multi_select then
                                if dropdown._selection_map[option] then
                                    dropdown._selection_map[option] = nil
                                    for index, value in ipairs(dropdown._selection_order) do
                                        if value == option then
                                            table.remove(dropdown._selection_order, index)
                                            break
                                        end
                                    end
                                else
                                    dropdown._selection_map[option] = true
                                    table.insert(dropdown._selection_order, option)
                                end
                            else
                                dropdown.selected_value = option
                                dropdown._selection_order = {option}
                                dropdown._selection_map = {[option] = true}
                                set_open(false)
                            end

                            dropdown:_apply_option_styles()

                            update_main_text()
                            fire_callback()
                        end

                        for _, option in ipairs(dropdown.options) do
                            local label = normalize_option(option)
                            local dropdown_item = helpers.new_instance('TextButton', {
                                Parent = dropdown.items_frame,
                                AnchorPoint = Vector2.new(0.5, 0),
                                AutoButtonColor = false,
                                BackgroundColor3 = theme.dropdownOptionBackground,
                                BackgroundTransparency = 0.75,
                                BorderSizePixel = 0,
                                Size = UDim2.new(1, 0, 0, OPTION_HEIGHT),
                                FontFace = Font.new(
                                    'rbxassetid://12187365364',
                                    Enum.FontWeight.Medium,
                                    Enum.FontStyle.Normal
                                ),
                                Text = label,
                                TextColor3 = theme.dropdownOptionTextColor,
                                TextSize = 12,
                                TextXAlignment = Enum.TextXAlignment.Center,
                                TextYAlignment = Enum.TextYAlignment.Center,
                            })

                            helpers.bind_theme(window, dropdown_item, "TextColor3", "dropdownOptionTextColor")

                            helpers.new_instance('UICorner', {
                                Parent = dropdown_item,
                                CornerRadius = UDim.new(0, 4),
                            })

                            local option_gradient = helpers.new_instance('UIGradient', {
                                Parent = dropdown_item,
                                Color = helpers.toColorSequence(theme.dropdownOptionGradient),
                                Rotation = 90,
                            })

                            helpers.bind_theme(window, option_gradient, "Color", "dropdownOptionGradient", {
                                convert = helpers.toColorSequence,
                            })

                            local option_stroke1 = helpers.new_instance('UIStroke', {
                                Parent = dropdown_item,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                BorderStrokePosition = Enum.BorderStrokePosition.Center,
                                Color = theme.dropdownOptionStroke,
                                Thickness = 1,
                                Transparency = 0.64,
                            })

                            helpers.bind_theme(window, option_stroke1, "Color", "dropdownOptionStroke")

                            local option_stroke2 = helpers.new_instance('UIStroke', {
                                Parent = dropdown_item,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                                Color = theme.dropdownOptionStroke,
                                Thickness = 1,
                                Transparency = 0.64,
                            })

                            helpers.bind_theme(window, option_stroke2, "Color", "dropdownOptionStroke")

                            local option_highlight = helpers.new_instance('UIStroke', {
                                Parent = dropdown_item,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                                Color = theme.dropdownOptionHighlightStroke,
                                Thickness = 2,
                                Transparency = 0.864,
                            })

                            helpers.bind_theme(window, option_highlight, "Color", "dropdownOptionHighlightStroke")

                            local entry = {
                                button = dropdown_item,
                                label = label,
                                isHovering = false,
                            }

                            track_dropdown_connection(dropdown_item.MouseEnter:Connect(function()
                                entry.isHovering = true
                                apply_option_style(entry, dropdown:_is_option_selected(label))
                            end))

                            track_dropdown_connection(dropdown_item.MouseLeave:Connect(function()
                                entry.isHovering = false
                                apply_option_style(entry, dropdown:_is_option_selected(label))
                            end))

                            track_dropdown_connection(dropdown_item.MouseButton1Click:Connect(function()
                                select_option(label)
                            end))

                            dropdown.option_buttons[label] = entry
                        end

                        for _, defaultValue in ipairs(normalized_defaults) do
                            for _, optionLabel in ipairs(dropdown.options) do
                                if optionLabel == defaultValue then
                                    if dropdown.multi_select then
                                        dropdown._selection_map[optionLabel] = true
                                        table.insert(dropdown._selection_order, optionLabel)
                                    else
                                        dropdown.selected_value = optionLabel
                                        dropdown._selection_order = {optionLabel}
                                        dropdown._selection_map = {[optionLabel] = true}
                                    end
                                    break
                                end
                            end
                        end

                        dropdown:_apply_option_styles(true)

                        update_main_text()

                        if (dropdown.multi_select and #dropdown._selection_order > 0) or (not dropdown.multi_select and dropdown.selected_value) then
                            fire_callback()
                        end

                        dropdown:_refresh_main_state(true)

                        window:_register_theme_dependent(function()
                            dropdown:_refresh_main_state(true)
                            dropdown:_apply_option_styles(true)
                            update_main_text()
                        end)

                        track_dropdown_connection(dropdown.main_button.MouseEnter:Connect(function()
                            dropdown.main_hovering = true
                            dropdown:_refresh_main_state()
                        end))

                        track_dropdown_connection(dropdown.main_button.MouseLeave:Connect(function()
                            dropdown.main_hovering = false
                            dropdown:_refresh_main_state()
                        end))

                        track_dropdown_connection(dropdown.main_button.MouseButton1Down:Connect(function()
                            dropdown:_apply_main_style("press")
                        end))

                        track_dropdown_connection(dropdown.main_button.MouseButton1Up:Connect(function()
                            dropdown:_refresh_main_state()
                        end))

                        track_dropdown_connection(dropdown.main_button.MouseButton1Click:Connect(function()
                            set_open(not dropdown.is_open)
                        end))

                        local function cleanup_dropdown_connections()
                            if dropdown._connections_cleaned then
                                return
                            end
                            dropdown._connections_cleaned = true
                            set_open(false)
                            for _, connection in ipairs(dropdown._connections) do
                                connection:Disconnect()
                            end
                            table.clear(dropdown._connections)
                            dropdown.option_buttons = {}
                        end

                        dropdown.destroy = cleanup_dropdown_connections

                        track_dropdown_connection(dropdown.host_frame.AncestryChanged:Connect(function(_, parent)
                            if not parent then
                                cleanup_dropdown_connections()
                            end
                        end))

                        return dropdown
                    end
                    return subsection
                end

                return tab
            end

            window.content["appended"] = true
            return tab_control
        end

        table.insert(interface.windows, window)
        return window
    end
    return interface
end

return redwine_interface
