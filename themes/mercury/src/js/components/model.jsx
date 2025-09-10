import React, { useRef } from 'react'
import { useGLTF } from '@react-three/drei'
import { useFrame } from '@react-three/fiber';

export function Model(props) {
    const group = useRef();
    const { nodes, materials } = useGLTF('/models/barn.glb');

    useFrame(() => {
        if (group.current) {
            group.current.rotation.y += 0.003;
        }
    });

    return (
        <group ref={group} {...props} dispose={null}>
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['Small_Barn_Cube013-Mesh'].geometry}
                material={materials.DarkRed}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['Small_Barn_Cube013-Mesh_1'].geometry}
                material={materials.White}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['Small_Barn_Cube013-Mesh_2'].geometry}
                material={materials.LightRed}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['Small_Barn_Cube013-Mesh_3'].geometry}
                material={materials.RoofBlack}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['Small_Barn_Door_Cube008-Mesh'].geometry}
                material={materials.DarkRed}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['Small_Barn_Door_Cube008-Mesh_1'].geometry}
                material={materials.White}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['Small_Barn_Door_Cube008-Mesh_2'].geometry}
                material={materials.LightRed}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['SmallBarn_Window_Cube023-Mesh'].geometry}
                material={materials.LightRed}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['SmallBarn_Window_Cube023-Mesh_1'].geometry}
                material={materials.White}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['SmallBarn_Window2_Cube022-Mesh'].geometry}
                material={materials.LightRed}
            />
            <mesh
                castShadow
                receiveShadow
                geometry={nodes['SmallBarn_Window2_Cube022-Mesh_1'].geometry}
                material={materials.White}
            />
        </group>
    )
}

useGLTF.preload('/models/barn.glb')