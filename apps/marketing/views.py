from django.shortcuts import render
import logging

from marketing.forms import TestForm


logger = logging.getLogger(__name__)


def homepage(request, template='marketing/homepage.html'):
    """Returns homepage.html for the root url"""
    logger.info('this homepage rocks!!!')
    return render(request, template, {})


def examples(request, template='marketing/examples.html'):
    """Sample view that can get deleted once developement starts"""
    logger.debug('take a look on this, awesome example!')
    form = TestForm()
    return render(request, template, {'form': form})
