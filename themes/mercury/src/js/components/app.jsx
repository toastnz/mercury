'use client'
import { Canvas } from '@react-three/fiber'
import { CameraControls, Plane } from '@react-three/drei'
import { Stats, SoftShadows, Sky } from '@react-three/drei'
import { useState } from 'react'
import { Perf } from 'r3f-perf'
import { Controls } from './controls'


export default function Home() {

    const [floorColour, setfloorColour] = useState();
    const [lightIntensity, setLightIntensity] = useState();

    const isDev = import.meta.env.MODE === 'development';

    return (
        <Canvas flat shadows className="w-full h-full" camera={{ position: [10, 5, -16], fov: 50 }}>
            <Sky distance={450000} sunPosition={[0, 1, 0]} inclination={0} azimuth={0.25} />
            <SoftShadows size={30} samples={15} focus={0.2} />
            <Plane receiveShadow args={[1000, 1000]} rotation-x={-Math.PI / 2} position={[0, 0, 0]}>
                <meshStandardMaterial color={floorColour} />
            </Plane>
            <CameraControls minPolarAngle={0} maxPolarAngle={Math.PI / 1.6} />
            <ambientLight intensity={lightIntensity} />
            <directionalLight castShadow position={[-1, 2, .5]} intensity={lightIntensity} />
            {isDev && (
                <>
                    <Stats />
                    <Perf position="bottom-right" />
                </>
            )}
            <Controls onColorChange={setfloorColour} onLightIntensityChange={setLightIntensity} />
        </Canvas>
    );
}

