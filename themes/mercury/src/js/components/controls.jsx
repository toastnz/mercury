import { useControls } from 'leva'

export function Controls({ onColorChange, onLightIntensityChange }) {
    useControls({
        floorColour: {
            value: '#8AA882',
            label: 'Floor Colour',
            onChange: onColorChange
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
}