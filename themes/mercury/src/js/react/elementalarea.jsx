import React from 'react';
import useSWR from 'swr'


const fetcher = (url) => fetch(url).then(res => res.json());



// If you want a component that renders multiple accordions from data, create a separate component:
const AccordionList = ({ items }) => {
    const [openIndex, setOpenIndex] = React.useState(null);

    return (
        <div className='flex flex-col items-center text-center text-slate-800 px-3'>
            <div className='max-w-xl w-full mt-6 flex flex-col gap-4 items-start text-left'>
                {items.map((item, index) => (
                    <div key={index} className='flex flex-col items-start w-full'>
                        <div className='flex items-center justify-between w-full cursor-pointer border border-indigo-100 p-4 rounded' onClick={() => setOpenIndex(openIndex === index ? null : index)}>
                            <h2 className='text-xl'>{item.title}</h2>
                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" className={`${openIndex === index ? "rotate-180" : ""} transition-all duration-500 ease-in-out`}>
                                <path d="m4.5 7.2 3.793 3.793a1 1 0 0 0 1.414 0L13.5 7.2" stroke="#1D293D" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                            </svg>
                        </div>
                        <p className={`text-sm text-slate-500 px-4 transition-all duration-500 ease-in-out ${openIndex === index ? "opacity-100 max-h-[300px] translate-y-0 pt-4" : "opacity-0 max-h-0 -translate-y-2"}`}>
                            <span dangerouslySetInnerHTML={{ __html: item.content }} />
                        </p>
                    </div>
                ))}
            </div>
        </div>
    );
};



// If you want a component that renders multiple accordions from data, create a separate component:
const TextBlock = ({ content }) => {
    console.log('TextBlock content:', content);
    return (
        <div className='flex flex-col items-start w-full'>
            <h2 className='text-sm'>{content.title}</h2>
            <p className='text-sm text-slate-500 px-4'>{content.body}</p>
        </div>
    );
};

export default function ElementalArea({ className = '' }) {

    // Use SWR with preloaded data fallback
    const { data: elementalData, error } = useSWR(
        'https://mercury.ddev.site/api/elemental',
        fetcher,
        {
            fallbackData: window.PRELOADED_ELEMENTAL || [],
            revalidateOnFocus: false,
            revalidateOnReconnect: true
        }
    );

    const renderBlock = (block, index) => {
        console.log('Rendering block:', block);
        switch (block.type) {
            case 'Toast\\Elements\\AccordionElement':
                return (
                    <AccordionList
                        key={index}
                        items={block.content.items}
                    />
                );
            case 'Toast\\Elements\\TextElement':
                return (
                    <TextBlock
                        key={index}
                        content={block.content}
                        variant={block.variant}
                    />
                );
            default:
                return null;
        }
    };

    console.log('ElementalArea blocks:', elementalData);

    return (
        <div className={`elemental-area ${className}`}>
            {elementalData.elements?.map((block, index) => renderBlock(block, index))}
        </div>
    );
}