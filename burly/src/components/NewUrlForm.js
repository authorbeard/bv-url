import React from 'react';

const NewUrlForm = ({onNewUrl = f => f}) => {
    let title
    const submit = e => {
        e.preventDefault()
        onNewUrl(title.value)
        title.value = ''
        title.focus()
    }

    return (
        <form onSubmit={submit}>
            <input  ref={input => title = input}
                    type="text"
                    placeholder="Title..." required />
            <button>Add Url</button>
        </form>
    )
}

export default NewUrlForm;