import { useControls } from 'leva'

export function Controls({ onBackColourChange, onFloorColourChange, onLightIntensityChange }) {
    useControls({
        backColour: {
            value: '#666666',
            label: 'Back Color',
            onChange: onBackColourChange
        },
        floorColour: {
            value: '#888888',
            label: 'Floor Colour',
            onChange: onFloorColourChange
        },
        lightIntensity: {
            value: 2,
            min: 1,
            max: 4,
            step: 0.1,
            label: 'Light Intensity',
            onChange: onLightIntensityChange
        }
    });
    return null;
}