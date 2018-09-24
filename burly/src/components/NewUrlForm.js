import React from 'react';

const NewUrlForm = ({onNewUrl = f => f}) => {
    let title, orig_url
    const submit = e => {
        e.preventDefault()
        onNewUrl(title.value, orig_url.value)
        title.value = ''
        title.focus()
    }

    return (
        <form onSubmit={submit}>
            <input  ref={input => orig_url = input}
                    type="text"
                    placeholder="URL you wanna shorten" required />
            <button>Add Url</button>
        </form>
    )
}

export default NewUrlForm;