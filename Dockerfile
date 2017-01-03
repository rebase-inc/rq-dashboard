FROM python:alpine

RUN pip --quiet install --upgrade pip && \
    pip --quiet install rq-dashboard

STOPSIGNAL SIGKILL

RUN echo "LOGGER_HANDLER_POLICY = 'debug'" > config.py
ENV RQ_DASHBOARD_SETTINGS "/config.py"

ENTRYPOINT ["rq-dashboard", "-H", "redis", "-b", "0.0.0.0", "-p", "4444", "--interval", "3000"]
