import React, { useRef } from 'react'
import { useGLTF } from '@react-three/drei'
import { useFrame } from '@react-three/fiber';

export function Tree(props) {
    const group = useRef();
    const { nodes, materials } = useGLTF('_resources/themes/mercury/dist/models/tree.glb');

    useFrame(() => {
        if (group.current) group.current.rotation.y += 0.003;
    });

    return (
        <group ref={group} {...props} dispose={null}>
            <group rotation={[-Math.PI / 2, 0, 0]} scale={100}>
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.Tree2_1.geometry}
                    material={materials.Brown}
                />
                <mesh
                    castShadow
                    receiveShadow
                    geometry={nodes.Tree2_2.geometry}
                    material={materials.Green}
                />
            </group>
        </group>
    )
}

useGLTF.preload('_resources/themes/mercury/dist/models/tree.glb')