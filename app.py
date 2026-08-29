import streamlit as st

from langchain_groq import ChatGroq
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser


st.set_page_config(
    page_title="devops_course",
    page_icon="🚨"
)

st.title("Groq ChatBot")

# -----------------------------
# Sidebar
# -----------------------------
with st.sidebar:
    st.header("🔐 Groq Configuration")

    groq_api_key = st.text_input(
        "Enter Groq API Key",
        type="password",
        placeholder="gsk_..."
    )

    model = st.selectbox(
        "Select Model",
        [
            "openai/gpt-oss-120b",
            "qwen/qwen3.8-27b"
        ]
    )

    temperature = st.slider(
        "Temperature",
        0.0,
        1.0,
        0.7
    )

    max_tokens = st.slider(
        "Max Tokens",
        100,
        2000,
        500
    )


# -----------------------------
# Prompt
# -----------------------------
prompt = ChatPromptTemplate.from_messages(
    [
        (
            "system",
            "You are a helpful assistant."
        ),
        (
            "user",
            "Question: {question}"
        )
    ]
)


# -----------------------------
# Initialize Groq
# -----------------------------
if groq_api_key:

    llm = ChatGroq(
        api_key=groq_api_key,
        model=model,
        temperature=temperature,
        max_tokens=max_tokens
    )

    output_parser = StrOutputParser()

    chain = prompt | llm | output_parser

    # -----------------------------
    # User Input
    # -----------------------------
    input_text = st.text_input(
        "Ask your question..?"
    )

    if input_text:

        with st.spinner("Thinking..."):

            response = chain.invoke(
                {
                    "question": input_text
                }
            )

        st.write(response)

else:

    st.info("👈 Please enter your Groq API key in the sidebar.")