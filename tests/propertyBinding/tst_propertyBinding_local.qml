/**********************************************************************
**
** Copyright (C) 2018 Luxoft Sweden AB
**
** This file is part of the FaceLift project
**
** Permission is hereby granted, free of charge, to any person
** obtaining a copy of this software and associated documentation files
** (the "Software"), to deal in the Software without restriction,
** including without limitation the rights to use, copy, modify, merge,
** publish, distribute, sublicense, and/or sell copies of the Software,
** and to permit persons to whom the Software is furnished to do so,
** subject to the following conditions:
**
** The above copyright notice and this permission notice shall be
** included in all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
** NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
** BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
** ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
** CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
** SOFTWARE.
**
** SPDX-License-Identifier: MIT
**
**********************************************************************/
import QtTest 1.2
import tests.propertybinding 1.0

TestCase {
    PropertyBindingInterfaceAPI {
        id: api
    }

    function test_intPropertyBinding() {
        compare(api.intProperty1, 0);
        compare(api.intProperty2, 0);
        api.intProperty2++;
        compare(api.intProperty1, 1);
    }

    function test_structPropertyBinding() {
        api.structProperty2.iData = 100;
        api.structProperty2.sData = "binding"
        api.structProperty2.bData = true;

        compare(api.structProperty1.iData, 100);
        compare(api.structProperty1.sData, "binding");
        compare(api.structProperty1.bData, true);

        api.structProperty2.iData = 99;
        compare(api.structProperty1.iData, 99);

        api.updateStructElement();
        compare(api.structProperty3.iData, 42);
    }
}
