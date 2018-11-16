/****************************************************************************
* ProjectX
*
* coreTest.cpp 
* Created by Abel Moyo on 16/11/2018.
****************************************************************************/

#include "../core.hpp"
#include <memory>
#include <gtest/gtest.h>
using ::testing::Test;
#include <gmock/gmock.h>
using ::testing::Eq;

namespace CoreTest
{
    namespace testing
    {
        class libCoreTest : public Test {
        protected:
            std::unique_ptr<Core> coreObject = nullptr;
            void SetUp() override{
                coreObject = std::make_unique<Core>();
            }
            void TearDown() override{}
        };

        TEST_F(libCoreTest, addOneAndThreeGivesFour)
        {
            EXPECT_EQ(coreObject->add(1, 3), 4);
        }

        TEST_F(libCoreTest, addMinusOneAndMinusThreeGivesMinusFour)
        {
            EXPECT_EQ(coreObject->add(-1, -3), -4);
        }
    }
}

